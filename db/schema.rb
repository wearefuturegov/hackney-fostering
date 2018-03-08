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

ActiveRecord::Schema.define(version: 20180214112952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foster_checks", force: :cascade do |t|
    t.integer "fostering_type"
    t.integer "housing_type"
    t.integer "be_in_touch"
    t.integer "emergency"
    t.integer "short_term"
    t.integer "long_term"
    t.integer "gender"
    t.integer "dob"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.integer "from"
    t.integer "to"
    t.integer "size"
    t.integer "neutered"
    t.integer "type_of_fostering"
    t.integer "are_you_religious"
    t.integer "what_is_your_religion"
    t.integer "what_do_you_practice"
    t.integer "country_of_birth"
    t.integer "language"
    t.integer "nationality"
    t.integer "practicing"
    t.integer "non_practicing"
    t.integer "employment_history"
    t.integer "national_insurance"
    t.integer "occupation"
    t.integer "name_of_employer"
    t.integer "name_of_employer_contact"
    t.integer "number_for_employer_contact"
    t.integer "spare_room"
    t.integer "other_ways"
    t.integer "good_time_to_contact"
    t.integer "contacting_you"
    t.integer "contact_phone_time"
    t.boolean "over_21"
    t.integer "experience"
    t.integer "ages"
    t.integer "housing"
    t.boolean "like_to_be_in_touch"
    t.string "what_is_your_name"
    t.string "what_is_your_name_change"
    t.string "previous_name_period"
    t.string "section"
    t.string "sub_section"
    t.string "name"
    t.string "last_name"
    t.string "postcode"
    t.string "email"
    t.string "phone_number"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
