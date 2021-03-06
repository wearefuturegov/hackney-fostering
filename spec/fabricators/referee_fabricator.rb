Fabricator(:referee) do
  first_name    { FFaker::Name.first_name }
  last_name     { FFaker::Name.last_name }
  gender        { Person.genders.values.sample }
  relationship  { Referee.relationships.values.sample }
  date_of_birth Date.today - 30.years
  years_known  '17 years'
  email        { FFaker::Internet.email }
  address      { Fabricate(:address) }
  phone_number { FFaker::PhoneNumber.phone_number }
  application  { Fabricate(:application) }
end
