class RemoveBeInTouchFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :be_in_touch, :integer
  end
end
