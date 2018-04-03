class Referee < Person
  belongs_to :address, optional: true
  has_one :application
  
  accepts_nested_attributes_for :address
  
  validates :first_name, presence: true, if: -> { application&.on_step?(%w[name]) }
  validates :last_name, presence: true, if: -> { application&.on_step?(%w[name]) }
  validates :email, presence: true, if: -> { application&.on_step?(%w[contact]) }
  validates :phone_number, presence: true, if: -> { application&.on_step?(%w[contact]) }
  validates :relationship, presence: true, if: -> { application&.on_step?(%w[reference_relationship]) }
  validates :years_known, presence: true, if: -> { application&.on_step?(%w[reference_relationship]) }
end
