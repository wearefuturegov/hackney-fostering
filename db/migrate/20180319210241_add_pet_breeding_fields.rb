class AddPetBreedingFields < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :breed_pets, :boolean
    add_column :applications, :where_breed_pets, :string
    add_column :applications, :offspring_kept, :text
    add_column :applications, :breeding_risks, :text
    add_column :applications, :breeding_other, :text
  end
end
