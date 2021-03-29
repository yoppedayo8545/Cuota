class SchoolYear < ActiveHash::Base
  self.data = [
    { id: 1, name: '1年生' },
    { id: 2, name: '2年生' },
    { id: 3, name: '3年生' },
    { id: 4, name: '4年生' },
    { id: 5, name: '5年生' },
    { id: 6, name: '6年生' },
    { id: 7, name: '卒業生' }
  ]

  include ActiveHash::Associations
  has_many :nursing_teachers
  has_many :students
end
