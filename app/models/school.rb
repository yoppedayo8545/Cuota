class School < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '吉田小学校' },
    { id: 3, name: '国立小学校' },
    { id: 4, name: '朝霞小学校' },
    { id: 5, name: '真田小学校' },
    { id: 6, name: '陸前高田小学校' },
    { id: 7, name: '泉新小学校' },
    { id: 8, name: 'ニャンニャン小学校' },
    { id: 9, name: 'ワンワン小学校' },
    { id: 10, name: 'しまじろう小学校' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :nursing_teachers
end
