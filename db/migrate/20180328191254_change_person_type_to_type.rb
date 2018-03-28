class ChangePersonTypeToType < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :person_type, :string
    add_column :people, :type, :string
  end
end
