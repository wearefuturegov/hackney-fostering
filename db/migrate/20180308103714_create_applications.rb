class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.integer :type_of_fostering
      t.integer :spare_room
      t.boolean :over_21
      t.integer :experience
      t.string :age_experience, array: true, default: []
      t.integer :housing_type
      t.integer :be_in_touch
      t.integer :contacting_you
      t.string :phone_number
      t.integer :contact_phone_time
      t.string :email
      t.integer :other_ways
      t.integer :applicant_id
      t.integer :address_id
      t.integer :best_way_to_contact
      t.boolean :practicing
      t.integer :religion
      t.string :other_religion
      t.string :beliefs
      t.integer :primary_language
      t.string :other_language
      t.string :secondary_languages
      t.integer :nationality
      t.string :other_nationality
      t.boolean :children_at_home
      t.integer :number_of_children
      t.integer :number_of_adults
      t.boolean :have_pets

      t.timestamps
    end
  end
end
