class AddCurrentStepToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :current_step, :string
  end
end
