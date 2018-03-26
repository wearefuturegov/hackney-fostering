class ChangeNationalityColumnToInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :nationality, :string
    add_column :people, :nationality, :integer
  end
end
