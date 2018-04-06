Fabricator(:child) do
  application     { Fabricate(:application) }
  first_name      { FFaker::Name.first_name }
  last_name       { FFaker::Name.last_name }
  gender          { Person.genders.values.sample }
  relationship    { Child.relationships.values.sample }
  date_of_birth   { Date.today - rand(1..17).years }
  school          'Some School'
  school_contact  FFaker::PhoneNumber.phone_number
end
