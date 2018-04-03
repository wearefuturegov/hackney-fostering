class Pet < ApplicationRecord
  belongs_to :application
  
  enum size: %i[small medium large]
  
  validates :pet_type, presence: true, if: -> { application.on_step?(%w[type]) }
  validates :size, presence: true, if: -> { application.on_step?(%w[size]) }
  validates :neutered, inclusion: [true, false], if: -> { application.on_step?(%w[neutered]) }
  validates :age, presence: true, if: -> { application.on_step?(%w[age]) }
  validates :where_allowed, presence: true, if: -> { application.on_step?(%w[where_allowed]) }
  validates :areas, presence: true, if: -> { application.on_step?(%w[areas]) }
  validates :sleeping_area, presence: true, if: -> { application.on_step?(%w[sleeping_area]) }
  validates :feeding_area, presence: true, if: -> { application.on_step?(%w[feeding_area]) }
  validates :safe_around_food, inclusion: [true, false], if: -> { application.on_step?(%w[safe_around_food]) }
  validates :temperament, presence: true, if: -> { application.on_step?(%w[temperament]) }
  validates :toilet, presence: true, if: -> { application.on_step?(%w[toilet]) }
  validates :bitten_or_hurt, inclusion: [true, false], if: -> { application.on_step?(%w[bitten_or_hurt]) }
  validates :bitten_or_hurt_detail, presence: true, if: -> {  application.on_step?(%w[bitten_or_hurt]) && bitten_or_hurt == true }
  validates :vet, inclusion: [true, false], if: -> { application.on_step?(%w[vet]) }
  validates :vaccinations, inclusion: [true, false], if: -> { application.on_step?(%w[vet]) }
  validates :children_experience, presence: true, if: -> { application.on_step?(%w[contact_with_children]) }
  validates :conflict, presence: true, if: -> { application.on_step?(%w[conflict]) }
  validates :conflict_resolution, presence: true, if: -> { application.on_step?(%w[conflict]) }
end
