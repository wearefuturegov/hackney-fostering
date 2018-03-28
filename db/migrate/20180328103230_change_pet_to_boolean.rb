class ChangePetToBoolean < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :vet, :string
    add_column :pets, :vet, :boolean
  end
end
