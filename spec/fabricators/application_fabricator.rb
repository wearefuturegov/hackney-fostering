Fabricator(:blank_application, from: :application) do
end

Fabricator(:application) do
  type_of_fostering   1
  spare_room          0
  over_21             true
  experience          1
  age_experience      %w[0_2 2_10]
  housing_type        1
  be_in_touch         0
  contacting_you      1
  phone_number        1232323
  contact_phone_time  1
  applicant           { Fabricate(:person) }
  address             { Fabricate(:address) }
  email               { FFaker::Internet.email }
  best_way_to_contact 1
  over_21             true
end

Fabricator(:complete_application, from: :application) do
  phone_number { FFaker::PhoneNumber.phone_number }  
end
