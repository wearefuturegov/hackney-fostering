class AddChildrenLivingElsewhere < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :children_living_elsewhere, :boolean
    add_column :applications, :number_of_children_elsewhere, :integer
    
    create_join_table :applications, :people, table_name: :applications_children_elsewhere do |t|
      t.index %i[application_id person_id], name: 'children_elsewhere_index'
    end
  end
end
