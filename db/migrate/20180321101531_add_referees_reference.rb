class AddRefereesReference < ActiveRecord::Migration[5.1]
  def change
    create_join_table :applications, :people, table_name: :applications_referees do |t|
      t.index %i[application_id person_id]
    end
  end
end
