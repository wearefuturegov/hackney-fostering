class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :pet_type
      t.integer :size
      t.boolean :neutered
      
      t.references :application

      t.timestamps
    end
  end
end
