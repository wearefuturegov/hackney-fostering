class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :address_type
      t.integer :uprn
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.string :post_town
      t.string :postcode
      t.date :date_from
      t.date :date_to
      
      t.references :application

      t.timestamps
    end
  end
end
