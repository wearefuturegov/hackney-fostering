class Child < Person
  include HouseholdMember
  
  validates :school, presence: true, if: -> { application&.on_step?(%w[school]) }
  validates :school_contact, presence: true, if: -> { application&.on_step?(%w[school]) }
end
