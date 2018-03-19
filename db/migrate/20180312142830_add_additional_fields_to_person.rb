class AddAdditionalFieldsToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :country_of_birth, :string
    add_column :people, :town_of_birth, :string
    add_column :people, :nationality, :string
  end
end
