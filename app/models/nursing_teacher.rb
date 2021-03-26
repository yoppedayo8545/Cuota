class NursingTeacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name
    validates :first_name
  end


  has_many :students

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :school_year
  belongs_to :school_class
  belongs_to :gender
end
