class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string          :last_name,        null: false
      t.string          :first_name,       null: false
      t.string          :last_kana,        null: false
      t.string          :first_kana,       null: false
      t.date            :date            
      t.integer         :school_year_id,   null: false
      t.integer         :school_class_id,  null: false
      t.integer         :number,           null: false
      t.integer         :gender_id,        null: false
      t.string          :brother
      t.text            :allergy
      t.text            :special_support
      t.text            :other_ht
      t.text            :other_nt
      t.integer         :school_id,        null: false
      t.references      :nursing_teacher,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
