class AdultElsewhere < Person
  include HouseholdMember
  
  enum relationship: %i[spouse partner ex_partner child lodger other]
end
