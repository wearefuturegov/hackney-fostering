class RemoveNationalityFromApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :nationality, :integer
    remove_column :applications, :other_nationality, :string
  end
end
