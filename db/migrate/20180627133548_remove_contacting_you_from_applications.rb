class RemoveContactingYouFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :contacting_you, :integer
  end
end
