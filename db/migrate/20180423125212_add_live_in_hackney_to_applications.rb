class AddLiveInHackneyToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :live_in_hackney, :boolean
  end
end
