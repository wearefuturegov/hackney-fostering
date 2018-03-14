class CreatePersonRelationTables < ActiveRecord::Migration[5.1]
  def change
    create_join_table :applications, :people, table_name: :applications_children do |t|
      t.index %i[application_id person_id]
    end
    
    create_join_table :applications, :people, table_name: :applications_adults do |t|
      t.index %i[application_id person_id]
    end
  end
end
