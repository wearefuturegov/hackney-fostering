class AddCurrentPathToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :current_path, :string
  end
end
