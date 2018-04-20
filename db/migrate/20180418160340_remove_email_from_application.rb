class RemoveEmailFromApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :email, :string
  end
end
