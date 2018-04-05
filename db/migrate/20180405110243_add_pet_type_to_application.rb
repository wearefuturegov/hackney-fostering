class AddPetTypeToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :pet_type, :string
  end
end
