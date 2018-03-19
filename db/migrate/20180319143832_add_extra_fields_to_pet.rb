class AddExtraFieldsToPet < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :age, :string
    add_column :pets, :where_allowed, :string
    add_column :pets, :areas, :string
    add_column :pets, :sleeping_area, :string
    add_column :pets, :feeding_area, :string
    add_column :pets, :safe_around_food, :boolean
    add_column :pets, :temperament, :string
    add_column :pets, :toilet, :string
    add_column :pets, :bitten_or_hurt, :boolean
    add_column :pets, :bitten_or_hurt_detail, :text
    add_column :pets, :vet, :string
    add_column :pets, :vaccinations, :boolean
    add_column :pets, :children_experience, :string
    add_column :pets, :conflict, :text
    add_column :pets, :conflict_resolution, :text
  end
end
