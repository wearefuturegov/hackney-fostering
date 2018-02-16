class CreateFosterChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :foster_checks do |t|
      t.integer :type_of_fostering
      t.integer :spare_room
      t.integer :other_ways
      t.integer :good_time_to_contact
      t.boolean :over_21
      t.integer :experience
      t.integer :ages
      t.integer :housing
      t.boolean :like_to_be_in_touch

      t.string :name
      t.string :postcode
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
