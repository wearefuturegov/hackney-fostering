class AddReligiousToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :religious, :boolean
  end
end
