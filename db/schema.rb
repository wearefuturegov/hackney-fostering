# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180308103717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type"
    t.integer "uprn"
    t.string "line_1"
    t.string "line_2"
    t.string "line_3"
    t.string "post_town"
    t.string "postcode"
    t.date "date_from"
    t.date "date_to"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_addresses_on_application_id"
  end

  create_table "applications", force: :cascade do |t|
    t.integer "type_of_fostering"
    t.integer "spare_room"
    t.boolean "over_21"
    t.integer "experience"
    t.string "age_experience", default: [], array: true
    t.integer "housing_type"
    t.integer "be_in_touch"
    t.integer "contacting_you"
    t.string "phone_number"
    t.integer "contact_phone_time"
    t.string "email"
    t.integer "other_ways"
    t.integer "applicant_id"
    t.integer "address_id"
    t.integer "best_way_to_contact"
    t.boolean "practicing"
    t.integer "religion"
    t.string "other_religion"
    t.string "beliefs"
    t.integer "primary_language"
    t.string "other_language"
    t.string "secondary_languages"
    t.integer "nationality"
    t.string "other_nationality"
    t.boolean "children_at_home"
    t.integer "number_of_children"
    t.integer "number_of_adults"
    t.boolean "have_pets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "person_type"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.date "date_of_birth"
    t.integer "relationship"
    t.string "previous_first_name"
    t.string "previous_last_name"
    t.date "date_changed"
    t.string "school"
    t.string "school_contact"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_people_on_application_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_type"
    t.integer "size"
    t.boolean "neutered"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_pets_on_application_id"
  end

end
