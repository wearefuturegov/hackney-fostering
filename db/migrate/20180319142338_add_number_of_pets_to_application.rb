class AddNumberOfPetsToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :number_of_pets, :integer
  end
end
