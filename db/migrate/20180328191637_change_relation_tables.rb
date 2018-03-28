class ChangeRelationTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :applications_adults
    drop_table :applications_adults_elsewhere
    drop_table :applications_children
    drop_table :applications_children_elsewhere
    drop_table :applications_referees
  end
end
