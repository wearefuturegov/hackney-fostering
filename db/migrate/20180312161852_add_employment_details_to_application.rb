class AddEmploymentDetailsToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :employment_type, :integer
    add_column :applications, :ni_number, :string
    add_column :applications, :occupation, :string
    add_column :applications, :employer, :string
    add_column :applications, :employer_contact_name, :string
    add_column :applications, :employer_phone_number, :string
  end
end
