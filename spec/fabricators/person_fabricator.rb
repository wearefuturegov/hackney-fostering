Fabricator(:person) do
  first_name    FFaker::Name.first_name
  last_name     FFaker::Name.last_name
  gender        { Person.genders.values.sample }
  relationship  { Person.relationships.values.sample }
  date_of_birth Date.today - 30.years
end

Fabricator(:child, from: :person) do
  date_of_birth   { Date.today - rand(1..17).years }
  school          'Some School'
  school_contact  FFaker::PhoneNumber.phone_number
end
