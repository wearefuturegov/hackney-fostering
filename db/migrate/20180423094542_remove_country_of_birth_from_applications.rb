class RemoveCountryOfBirthFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :country_of_birth, :string
  end
end
