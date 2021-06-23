class Student < ApplicationRecord
  belongs_to :nursing_teacher
  has_one_attached :image

  with_options presence: true do
    validates :last_name, :first_name, :last_kana, :first_kana, :school_year_id, :school_class_id, :number, :gender_id, :school_id
  end

  validates :number, numericality: { only_integer: true }

  def full_name
    "#{number}  #{last_name}  #{first_name}"
  end

  scope :sort_students, -> { order(:gender_id).order(:last_kana).order(:date) }

  def self.search(search)
    if search == 'アレルギー'
      Student.where.not(allergy: " ")
    elsif search != ''
      Student.where('last_name LIKE(?) or first_name LIKE(?) or allergy LIKE(?) or allergy_other LIKE(?) 
      or special_support LIKE(?) or other_ht LIKE(?) or other_nt LIKE(?)',
                    "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Student.all
    end
  end

  HEADER_TO_SYM_MAP = {
    '姓' => :last_name,
    '名' => :first_name,
    'セイ' => :last_kana,
    'メイ' => :first_kana,
    '学年' => :school_year_id, 
    'クラス' => :school_class_id,
    '出席番号' => :number,
    '性別' => :gender_id,
    '学校' => :school_id,
    '先生' => :nursing_teacher_id
  }

  HEADER_CONVERTER_JA = {
     last_name: '姓',
     first_name: '名',
     last_kana: 'セイ',
     first_kana: 'メイ',
     school_year_id: '学年',
     school_class_id: 'クラス',
     number: '出席番号',
     gender_id: '性別',
     school_id: '学校',
     nursing_teacher_id: '先生'
  }

  def self.import(file)
    return if file.nil?
    Student.transaction do
      header_converter = lambda { |h| HEADER_TO_SYM_MAP[h] }
      @num = 0
      @error_nums = []
      @errors = []
      CSV.foreach(file.path, encoding: 'Shift_JIS:UTF-8', headers: true, header_converters: header_converter, skip_blanks: true).with_index(1) do |row, row_number|  
        # カラムがあるかチェック
        search_culumn(row)
        if @error_culumns.present?
          header_converter_ja(@error_culumns)
          return @errors.push({:row_num => nil, :messages => @error_culumns })
        end
        student = find_by(id: row["id"]) || new
        student.attributes = row.to_hash
        # エラーが無い場合に件数の抽出
        if student.valid?
          @num += 1
        else
        # 不正なカラムの抽出
          @errors.push({:row_num => row_number, :messages => student.errors.full_messages})
          next
        end
        student.save!
      end
    end
    if @errors.present?
      @errors
    else 
      @num
    end
  end
  
  def self.updatable_attributes
    [:last_name, :first_name, :last_kana, :first_kana, :school_year_id, :school_class_id, :gender_id, :school_id, :number, :nursing_teacher_id]
  end
  
  # csvデータのカラム判定
  def self.search_culumn(search = [])
    header = search.headers
    @error_culumns = [:last_name, :first_name, :last_kana, :first_kana, :school_year_id, :school_class_id, :gender_id, :school_id, :number, :nursing_teacher_id]
    @error_culumns.delete_if do |h|
      header.include?(h)
    end
  end

  # search_culumnメソッドで取得したカラムの日本語化
  def self.header_converter_ja(error_culumns)
    header_converter = HEADER_CONVERTER_JA
    @error_culumns = error_culumns.map! do |e|
      e = header_converter[e]
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :school_year
  belongs_to :school_class
  belongs_to :gender
end
