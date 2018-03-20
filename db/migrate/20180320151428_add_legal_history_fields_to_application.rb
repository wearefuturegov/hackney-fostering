class AddLegalHistoryFieldsToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :family_court, :boolean
    add_column :applications, :court_date, :date
    add_column :applications, :court_name, :string
    add_column :applications, :type_of_order, :string
    add_column :applications, :parties_involved, :text
    add_column :applications, :court_details, :text
    add_column :applications, :previous_applications, :boolean
    add_column :applications, :application_date, :date
    add_column :applications, :agency_name, :string
    add_column :applications, :agency_address_id, :integer, index: true
    add_column :applications, :type_of_application, :string
    add_column :applications, :application_outcome, :text
    add_column :applications, :other_previous_applications, :boolean
    add_column :applications, :other_application_date, :date
    add_column :applications, :other_agency_name, :string
    add_column :applications, :other_agency_address_id, :integer, index: true
    add_column :applications, :other_type_of_application, :string
    add_column :applications, :other_application_outcome, :text
    add_column :applications, :previous_fostering, :boolean
    add_column :applications, :previous_agency_name, :string
    add_column :applications, :previous_agency_address_id, :integer, index: true
  end
end
