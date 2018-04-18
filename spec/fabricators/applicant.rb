Fabricator(:applicant) do
  first_name    { FFaker::Name.first_name }
  last_name     { FFaker::Name.last_name }
  gender        { Person.genders.values.sample }
  date_of_birth Date.today - 30.years
end

Fabricator(:applicant_with_email, from: :applicant) do
  email { FFaker::Internet.email }
end
