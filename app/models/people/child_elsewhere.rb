class ChildElsewhere < Person
  include HouseholdMember
  
  enum relationship: %i[child sibling foster_child stepchild other_relationship]
  
  validates :school, presence: true, if: -> { on_edit_step? }
  validates :school_contact, presence: true, if: -> { on_edit_step? }
end
