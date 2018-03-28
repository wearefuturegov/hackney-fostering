Fabricator(:referee) do
  first_name    { FFaker::Name.first_name }
  last_name     { FFaker::Name.last_name }
  gender        { Person.genders.values.sample }
  relationship  { Person.relationships.values.sample }
  date_of_birth Date.today - 30.years
  years_known  '17 years'
  email        { FFaker::Internet.email }
  phone_number { FFaker::PhoneNumber.phone_number }
end
