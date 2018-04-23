Fabricator(:blank_application, from: :application) do
end

Fabricator(:application) do
  type_of_fostering   %w[short_term_fostering long_term_fostering]
  spare_room          0
  over_21             true
  experience          1
  age_experience      %w[0_2 2_10]
  housing_type        1
  contacting_you      1
  phone_number        1232323
  contact_phone_time  %w[morning]
  applicant           { Fabricate(:applicant_with_email) }
  address             { Fabricate(:address) }
  best_way_to_contact 1
  over_21             true
  other_ways          1
end

Fabricator(:complete_application, from: :application) do
  phone_number  { FFaker::PhoneNumber.phone_number }
  support_carer { Fabricate(:support_carer) }
  agree_to_checks true
  agree_to_la_contact true
end

Fabricator(:eligible_application, from: :application) do
  eligible            1
  applicant           { Fabricate(:applicant_with_login) }
end
