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

ActiveRecord::Schema.define(version: 20180319143832) do

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
  end

  create_table "applications_adults", id: false, force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "person_id", null: false
    t.index %w[application_id person_id], name: "index_applications_adults_on_application_id_and_person_id"
  end

  create_table "applications_adults_elsewhere", id: false, force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "person_id", null: false
    t.index %w[application_id person_id], name: "adults_elsewhere_index"
  end

  create_table "applications_children", id: false, force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "person_id", null: false
    t.index %w[application_id person_id], name: "index_applications_children_on_application_id_and_person_id"
  end

  create_table "applications_children_elsewhere", id: false, force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "person_id", null: false
    t.index %w[application_id person_id], name: "children_elsewhere_index"
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
    t.string "country_of_birth"
    t.string "town_of_birth"
    t.string "nationality"
    t.index ["application_id"], name: "index_people_on_application_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_type"
    t.integer "size"
    t.boolean "neutered"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "age"
    t.string "where_allowed"
    t.string "areas"
    t.string "sleeping_area"
    t.string "feeding_area"
    t.boolean "safe_around_food"
    t.string "temperament"
    t.string "toilet"
    t.boolean "bitten_or_hurt"
    t.text "bitten_or_hurt_detail"
    t.string "vet"
    t.boolean "vaccinations"
    t.string "children_experience"
    t.text "conflict"
    t.text "conflict_resolution"
    t.index ["application_id"], name: "index_pets_on_application_id"
  end

end
