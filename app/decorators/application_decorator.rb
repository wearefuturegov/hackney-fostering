class ApplicationDecorator < MainDecorator
  delegate :code
  
  def type_of_fostering
    standard_wrapper('Type of Fostering:', application.type_of_fostering)
  end
  
  def spare_room
    standard_wrapper('Has a spare room?:', application.spare_room)
  end
  
  def over_21
    standard_wrapper('Over 21?:', value_from(application.over_21))
  end
  
  def experience
    standard_wrapper('Level of experience:', application.experience)
  end

  def age_experience
    standard_wrapper('Ages of children:', application.age_experience.join(' ,'))
  end
  
  def housing_type
    standard_wrapper('Housing type?:', application.housing_type)
  end
  
  def first_name
    standard_wrapper('First Name:', application.applicant.first_name)
  end

  def last_name
    standard_wrapper('Last Name:', application.applicant.last_name)
  end

  def postcode
    standard_wrapper('Postcode:', application.postcode)
  end
  
  def best_way_to_contact
    standard_wrapper('Best way to contact:', application.contacting_you)
  end

  def phone_number
    standard_wrapper('Phone Number:', application.phone_number)
  end
  
  def contact_phone_time
    standard_wrapper('Best time to contact:', application.contact_phone_time)
  end
  
  def email
    standard_wrapper('Email:', application.email)
  end
  
end
