class ChangeContactPhoneTimeToArray < ActiveRecord::Migration[5.1]
  def change
    change_column :applications, :contact_phone_time, 'text[] USING ARRAY[contact_phone_time]::INTEGER[]', array: true, null: false, default: []
  end
end
