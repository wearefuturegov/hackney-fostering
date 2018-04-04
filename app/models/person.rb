class Person < ApplicationRecord
  enum gender: %i[male female other],
       relationship: %i[child sibling foster_child stepchild other_relationship]

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.person.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
