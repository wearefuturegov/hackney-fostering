class FosterCheck < ApplicationRecord
  enum type_of_fostering: %i[emergency_fostering short_term_fostering long_term_fostering dont_know],
       spare_room: %i[yes no not_yet],
       other_ways: %i[mentoring specialist_support other_support],
       good_time_to_contact: %i[morning afternoon evening],
       experience: %i[very somewhat little no_experience],
       ages: %i[0_2 2_10 11_18],
       housing: %i[owner housing_association renting]
       
end
