class CreateFosterChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :foster_checks do |t|
      t.integer :fostering_type
      t.integer :housing_type
      t.integer :be_in_touch
      t.integer :emergency
      t.integer :short_term
      t.integer :long_term
      t.integer :gender
      t.integer :dob
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :from
      t.integer :to
      t.integer :size
      t.integer :neutered
      t.integer :type_of_fostering
      t.integer :are_you_religious
      t.integer :what_is_your_religion
      t.integer :what_do_you_practice
      t.integer :country_of_birth
      t.integer :language
      t.integer :nationality
      t.integer :practicing
      t.integer :non_practicing
      t.integer :employment_history
      t.integer :national_insurance
      t.integer :occupation
      t.integer :name_of_employer
      t.integer :name_of_employer_contact
      t.integer :number_for_employer_contact
      t.integer :spare_room
      t.integer :other_ways
      t.integer :good_time_to_contact
      t.integer :contacting_you
      t.integer :contact_phone_time
      t.boolean :over_21
      t.integer :experience
      t.integer :ages
      t.integer :housing
      t.boolean :like_to_be_in_touch

      t.string :what_is_your_name
      t.string :what_is_your_name_change
      t.string :previous_name_period
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
