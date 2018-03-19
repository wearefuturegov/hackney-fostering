class AddAdultsElsewhere < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :adults_living_elsewhere, :boolean
    add_column :applications, :number_of_adults_elsewhere, :integer
    
    create_join_table :applications, :people, table_name: :applications_adults_elsewhere do |t|
      t.index %i[application_id person_id], name: 'adults_elsewhere_index'
    end
  end
end
