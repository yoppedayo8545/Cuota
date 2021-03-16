class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string        :name,           null: false
      t.string        :postal_code,    null: false
      t.string        :prefectures,    null: false
      t.string        :city,           null: false
      t.string        :address,        null: false
      t.integer       :phone_num,      null: false
      t.timestamps
    end
  end
end
