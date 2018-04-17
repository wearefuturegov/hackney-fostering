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

ActiveRecord::Schema.define(version: 20180417121210) do

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
    t.text "type_of_fostering", default: [], null: false, array: true
    t.integer "spare_room"
    t.boolean "over_21"
    t.integer "experience"
    t.string "age_experience", default: [], array: true
    t.integer "housing_type"
    t.integer "be_in_touch"
    t.integer "contacting_you"
    t.string "phone_number"
    t.text "contact_phone_time", default: [], null: false, array: true
    t.string "email"
    t.integer "other_ways"
    t.integer "applicant_id"
    t.integer "address_id"
    t.integer "best_way_to_contact"
    t.boolean "practicing"
    t.string "religion"
    t.string "other_religion"
    t.string "beliefs"
    t.string "primary_language"
    t.string "other_language"
    t.string "secondary_languages"
    t.boolean "children_at_home"
    t.integer "number_of_children"
    t.integer "number_of_adults"
    t.boolean "have_pets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "name_change"
    t.boolean "religious"
    t.integer "employment_type"
    t.string "ni_number"
    t.string "occupation"
    t.string "employer"
    t.string "employer_contact_name"
    t.string "employer_phone_number"
    t.boolean "children_living_elsewhere"
    t.integer "number_of_children_elsewhere"
    t.boolean "adults_living_at_home"
    t.boolean "adults_living_elsewhere"
    t.integer "number_of_adults_elsewhere"
    t.integer "number_of_pets"
    t.string "code"
    t.boolean "family_court"
    t.date "court_date"
    t.string "court_name"
    t.string "type_of_order"
    t.text "parties_involved"
    t.text "court_details"
    t.boolean "previous_applications"
    t.date "application_date"
    t.string "agency_name"
    t.integer "agency_address_id"
    t.string "type_of_application"
    t.text "application_outcome"
    t.boolean "other_previous_applications"
    t.date "other_application_date"
    t.string "other_agency_name"
    t.integer "other_agency_address_id"
    t.string "other_type_of_application"
    t.text "other_application_outcome"
    t.boolean "previous_fostering"
    t.string "previous_agency_name"
    t.integer "previous_agency_address_id"
    t.bigint "support_carer_id"
    t.boolean "agree_to_checks"
    t.boolean "agree_to_la_contact"
    t.string "signature"
    t.boolean "eligible"
    t.string "current_path"
    t.string "current_step"
    t.string "pet_type"
    t.index ["support_carer_id"], name: "index_applications_on_support_carer_id"
  end

  create_table "people", force: :cascade do |t|
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
    t.string "country_of_birth"
    t.string "town_of_birth"
    t.string "email"
    t.string "phone_number"
    t.string "years_known"
    t.bigint "address_id"
    t.string "nationality"
    t.string "type"
    t.index ["address_id"], name: "index_people_on_address_id"
    t.index ["application_id"], name: "index_people_on_application_id"
  end

end
