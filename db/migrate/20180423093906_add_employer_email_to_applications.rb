class AddEmployerEmailToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :employer_email, :string
  end
end
