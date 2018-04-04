class ChangeNationalityToString < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :nationality, :string
  end
end
