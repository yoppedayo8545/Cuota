class AddStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students,:school_year_update,:integer
  end
end