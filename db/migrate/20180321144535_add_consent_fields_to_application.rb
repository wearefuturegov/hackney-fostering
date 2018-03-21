class AddConsentFieldsToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :agree_to_checks, :boolean
    add_column :applications, :agree_to_la_contact, :boolean
    add_column :applications, :signature, :string
  end
end
