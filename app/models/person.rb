class Person < ApplicationRecord
  belongs_to :application, optional: true
  
  enum person_type: %i[applicant child adult],
       gender: %i[male female other],
       nationality: %i[british british_english british_scottish british_welsh]
end
