class Child < Person
  include HouseholdMember
  
  enum relationship: %i[child sibling foster_child stepchild other_relationship]
end
