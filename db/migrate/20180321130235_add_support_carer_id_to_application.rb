class AddSupportCarerIdToApplication < ActiveRecord::Migration[5.1]
  def change
    add_reference :applications, :support_carer
  end
end
