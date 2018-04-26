class RemoveCodeFromApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :code, :string
  end
end
