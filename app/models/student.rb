class Student < ApplicationRecord
  belongs_to :nursing_teacher

  with_options presence: true do
    validates :last_name, :first_name, :school_year_id, :school_class_id, :number, :gender_id, :school_id, :nursing_teacher_id
  end

  validates :number, numericality: { only_integer: true }

  def full_name
    "#{number}  #{last_name}  #{first_name}"
  end

  def self.search(search)
    if search != ''
      Student.where('last_name LIKE(?) or first_name LIKE(?) or allergy LIKE(?) or
      special_support LIKE(?) or other_ht LIKE(?) or other_nt LIKE(?)',
                    "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Student.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :school_year
  belongs_to :school_class
  belongs_to :gender
end
