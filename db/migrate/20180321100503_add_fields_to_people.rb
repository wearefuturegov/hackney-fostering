class AddFieldsToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :email, :string
    add_column :people, :phone_number, :string
    add_column :people, :years_known, :string

    add_reference :people, :address
  end
end
