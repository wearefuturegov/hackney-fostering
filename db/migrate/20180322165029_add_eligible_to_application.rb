class AddEligibleToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :eligible, :boolean
  end
end
