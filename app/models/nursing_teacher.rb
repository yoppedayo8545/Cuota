class NursingTeacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name
    validates :first_name
  end

  with_options numericality: { other_than: 1 } do
    validates :school_id
  end

  has_many :students

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
end
