class Person < ApplicationRecord
  belongs_to :application, optional: true
  belongs_to :address, optional: true
  
  accepts_nested_attributes_for :address
  
  has_many :applications_children
  has_many :applications_adults

  enum gender: %i[male female other],
       nationality: %i[british british_english british_scottish british_welsh],
       relationship: %i[child sibling foster_child stepchild other_relationship]

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.person.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
