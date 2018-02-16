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
    t.integer "type_of_fostering"
    t.integer "spare_room"
    t.integer "other_ways"
    t.integer "good_time_to_contact"
    t.boolean "over_21"
    t.integer "experience"
    t.integer "ages"
    t.integer "housing"
    t.boolean "like_to_be_in_touch"
    t.string "name"
    t.string "postcode"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
