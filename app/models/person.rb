class Person < ApplicationRecord
  belongs_to :application, optional: true
  
  has_many :applications_children
  has_many :applications_adults

  enum gender: %i[male female other],
       nationality: %i[british british_english british_scottish british_welsh],
       relationship: %i[child sibling foster_child stepchild other_relationship]
end
