class Person < ApplicationRecord
  belongs_to :application, optional: true
  
  has_many :applications_children
  has_many :applications_adults

  enum person_type: %i[applicant child adult],
       gender: %i[male female other],
       nationality: %i[british british_english british_scottish british_welsh]
end
