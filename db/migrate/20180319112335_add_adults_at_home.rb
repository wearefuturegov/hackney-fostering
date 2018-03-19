class AddAdultsAtHome < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :adults_living_at_home, :boolean
  end
end
