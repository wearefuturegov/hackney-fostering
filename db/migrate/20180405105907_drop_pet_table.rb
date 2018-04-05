class DropPetTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :pets
  end
end
