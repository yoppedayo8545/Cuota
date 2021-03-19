class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string          :last_name,        null: false
      t.string          :first_name,       null: false
      t.date            :date            
      t.integer         :school_year,      null: false
      t.string          :school_class,     null: false
      t.integer         :numder,           null: false
      t.string          :gender,           null: false
      t.string          :brother
      t.text            :allergy
      t.text            :special_support
      t.text            :other_ht
      t.text            :other_nt
      t.references      :nursing_teacher,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
