class AddSchoolIdToNursingTeachers < ActiveRecord::Migration[6.0]
  def change
    add_reference :nursing_teachers, :school, null: false, foreign_key: true
  end
end
