Fabricator(:person) do
  first_name    FFaker::Name.first_name
  last_name     FFaker::Name.last_name
  gender        1
  date_of_birth '1987-03-07'
  relationship  1
end
