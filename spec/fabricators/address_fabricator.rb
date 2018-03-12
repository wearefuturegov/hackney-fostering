Fabricator(:address) do
  uprn      1
  line_1    FFaker::AddressUK.street_address
  line_3    FFaker::AddressUK.secondary_address
  post_town FFaker::AddressUK.city
  postcode  FFaker::AddressUK.postcode
  date_from '2018-03-07'
  date_to   '2018-03-07'
end
