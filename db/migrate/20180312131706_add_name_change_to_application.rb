class AddNameChangeToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :name_change, :boolean
  end
end
