class ChangeLanguageAndReligionToText < ActiveRecord::Migration[5.1]
  def change
    change_column :applications, :primary_language, :string
    change_column :applications, :religion, :string
  end
end
