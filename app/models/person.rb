class Person < ApplicationRecord
  belongs_to :application, optional: true
  
  enum person_type: %i[applicant child adult],
       gender: %i[male female other]
end
