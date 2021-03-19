# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_19_031256) do

  create_table "nursing_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "school_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_nursing_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_nursing_teachers_on_reset_password_token", unique: true
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.date "date"
    t.integer "school_year", null: false
    t.string "school_class", null: false
    t.integer "number", null: false
    t.string "gender", null: false
    t.string "brother"
    t.text "allergy"
    t.text "special_support"
    t.text "other_ht"
    t.text "other_nt"
    t.integer "school_id", null: false
    t.bigint "nursing_teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nursing_teacher_id"], name: "index_students_on_nursing_teacher_id"
  end

  add_foreign_key "students", "nursing_teachers"
end
