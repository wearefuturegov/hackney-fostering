class RemovePetQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :breed_pets, :boolean
    remove_column :applications, :where_breed_pets, :string
    remove_column :applications, :offspring_kept, :text
    remove_column :applications, :breeding_risks, :text
    remove_column :applications, :breeding_other, :text
  end
end
