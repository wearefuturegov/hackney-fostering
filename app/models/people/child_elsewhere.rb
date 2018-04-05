class ChildElsewhere < Person
  include HouseholdMember
  
  enum relationship: %i[child sibling foster_child stepchild other_relationship]
  
  validates :school, presence: true, if: -> { application&.on_step?(%w[school]) }
  validates :school_contact, presence: true, if: -> { application&.on_step?(%w[school]) }
end
