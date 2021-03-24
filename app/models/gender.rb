class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '男' },
    { id: 2, name: '女' },
  ]

  include ActiveHash::Associations
  has_many :nursing_teachers
  has_many :students
end
