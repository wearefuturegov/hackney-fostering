class AddCCodeToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :code, :string
    Application.all.each { |a| a.send(:generate_code) }
  end
end
