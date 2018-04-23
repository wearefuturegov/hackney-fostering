class PersonDecorator < MainDecorator
  decorates_association :address
  
  delegate :login
  
  def first_name
    standard_wrapper('First Name', person.first_name)
  end

  def last_name
    standard_wrapper('Last Name', person.last_name)
  end
  
  def full_name
    [person.first_name, person.last_name].join(' ')
  end
  
  def gender
    standard_wrapper('Gender', person.gender)
  end
  
  def email
    standard_wrapper('Email', person.email)
  end
  
  def date_of_birth
    standard_wrapper('Date of Birth', person.date_of_birth&.to_s(:long))
  end
  
  def town_of_birth
    standard_wrapper('Town of Birth', person.town_of_birth)
  end
  
  def nationality
    standard_wrapper('Nationality', person.nationality)
  end
end
