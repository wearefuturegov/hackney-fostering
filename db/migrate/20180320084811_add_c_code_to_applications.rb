class AddCCodeToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :code, :string
  end
end
