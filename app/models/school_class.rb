class SchoolClass < ActiveHash::Base
  self.data = [
    { id: 1, name: '1組' },
    { id: 2, name: '2組' },
    { id: 3, name: '3組' },
    { id: 4, name: '4組' },
    { id: 5, name: '5組' },
  ]

  include ActiveHash::Associations
  has_many :nursing_teachers
  has_many :students
end
