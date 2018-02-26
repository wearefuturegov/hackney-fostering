class CreateFosterChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :foster_checks do |t|
      t.integer :gender
      t.integer :dob
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :size
      t.integer :neutered
      t.integer :type_of_fostering
      t.integer :are_you_practicing
      t.integer :what_do_you_practice
      t.integer :language
      t.integer :nationality
      t.integer :practicing
      t.integer :non_practicing
      t.integer :spare_room
      t.integer :other_ways
      t.integer :good_time_to_contact
      t.boolean :over_21
      t.integer :experience
      t.integer :ages
      t.integer :housing
      t.boolean :like_to_be_in_touch

      t.string :what_is_your_name
      t.string :section
      t.string :sub_section
      t.string :name
      t.string :last_name
      t.string :postcode
      t.string :email
      t.string :phone_number
      t.string :relationship

      t.timestamps
    end
  end
end
