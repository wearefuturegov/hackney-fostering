class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :person_type
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.date :date_of_birth
      t.integer :relationship
      t.string :previous_first_name
      t.string :previous_last_name
      t.date :date_changed
      t.string :school
      t.string :school_contact
      
      t.references :application

      t.timestamps
    end
  end
end
