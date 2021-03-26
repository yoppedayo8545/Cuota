class AddImageIconToNursingTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :nursing_teachers,:image_icon,:string
  end
end
