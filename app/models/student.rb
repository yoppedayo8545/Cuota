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

  def self.import(file)
    return if file.nil?
    Student.transaction do
      header_converter = lambda { |h| HEADER_TO_SYM_MAP[h] }
      @num = 0
      @error_nums = []
      @errors = []
      CSV.foreach(file.path, encoding: 'Shift_JIS:UTF-8', headers: true, header_converters: header_converter, skip_blanks: true).with_index(1) do |row, row_number|  
        student = find_by(id: row["id"]) || new
        student.attributes = row.to_hash.slice(*updatable_attributes)
        begin
          if student.save!
            @num += 1
          else
          end
        rescue
           # 不正なカラムの抽出
           @errors.push({:row_num => row_number, :messages => student.errors.full_messages})
           next
        end
      end
    end
    if @errors.present?
      @errors
    else 
      @num
    end
  end
  
  def self.updatable_attributes
    ['last_name', 'first_name', 'last_kana', 'first_kana', 'school_year_id', 'school_class_id', 'gender_id', 'school_id', 'number', 'nursing_teacher_id']
  end
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :school_year
  belongs_to :school_class
  belongs_to :gender
end
