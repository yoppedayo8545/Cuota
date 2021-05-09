class Student < ApplicationRecord
  belongs_to :nursing_teacher
  has_one_attached :image

  with_options presence: true do
    validates :last_name, :first_name, :school_year_id, :school_class_id, :number, :gender_id, :school_id, :nursing_teacher_id
  end

  validates :number, numericality: { only_integer: true }

  def full_name
    "#{number}  #{last_name}  #{first_name}"
  end

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

  def self.import(file)
    CSV.foreach(file.path, encoding: 'Shift_JIS:UTF-8', headers: true) do |row|
      student = find_by(id: row["id"]) || new
      student.attributes = row.to_hash.slice(*updatable_attributes)
        if student.school_id == nil?
          student.school_id = @nursing_teacher.school_id
        end
        if student.nursing_teacher_id == nil?
          student.nursing_teacher_id = @nursing_teacher.id
        end
      student.save!(validate: false)
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
