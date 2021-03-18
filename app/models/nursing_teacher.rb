class NursingTeacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :last_name
          validates :first_name
         end      

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :school
end
