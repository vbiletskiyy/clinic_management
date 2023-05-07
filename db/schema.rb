# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_07_164833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.text "recommendation"
    t.boolean "closed"
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctor_patients", id: false, force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.index ["doctor_id"], name: "index_doctor_patients_on_doctor_id"
    t.index ["patient_id"], name: "index_doctor_patients_on_patient_id"
  end

  create_table "doctors_specialties", id: false, force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "specialty_id", null: false
    t.index ["doctor_id", "specialty_id"], name: "index_doctors_specialties_on_doctor_id_and_specialty_id"
    t.index ["specialty_id", "doctor_id"], name: "index_doctors_specialties_on_specialty_id_and_doctor_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_specialties_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "password_digest", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "users", column: "doctor_id"
  add_foreign_key "appointments", "users", column: "patient_id"
  add_foreign_key "doctor_patients", "users", column: "doctor_id"
  add_foreign_key "doctor_patients", "users", column: "patient_id"
end
