class ChangeTypeOfFosteringToArray < ActiveRecord::Migration[5.1]
  def change
    change_column :applications, :type_of_fostering, 'text[] USING ARRAY[type_of_fostering]::INTEGER[]', array: true, null: false, default: []
  end
end
