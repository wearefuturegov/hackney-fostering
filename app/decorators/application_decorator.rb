class ApplicationDecorator < MainDecorator # rubocop:disable Metrics/ClassLength
  delegate :code,
           :eligible,
           :name_change,
           :children_at_home,
           :children_living_elsewhere,
           :adults_living_at_home,
           :adults_living_elsewhere,
           :have_pets,
           :breed_pets,
           :family_court,
           :previous_applications,
           :other_previous_applications,
           :previous_fostering

  decorates_association :address
  decorates_association :applicant
  decorates_association :addresses
  decorates_association :children
  decorates_association :children_elsewhere
  decorates_association :adults
  decorates_association :adults_elsewhere
  decorates_association :pets
  decorates_association :agency_address
  decorates_association :referees
  decorates_association :support_carer
  
  def type_of_fostering
    standard_wrapper('Type of Fostering', application.type_of_fostering)
  end
  
  def spare_room
    standard_wrapper('Has a spare room?', application.spare_room)
  end
  
  def over_21
    standard_wrapper('Over 21?', value_from(application.over_21))
  end
  
  def experience
    standard_wrapper('Level of experience', application.experience)
  end

  def age_experience
    standard_wrapper('Ages of children', application.age_experience.join(' ,'))
  end
  
  def housing_type
    standard_wrapper('Housing type?', application.housing_type)
  end

  def postcode
    standard_wrapper('Postcode', application.postcode)
  end
  
  def best_way_to_contact
    standard_wrapper('Best way to contact', application.contacting_you)
  end

  def phone_number
    standard_wrapper('Phone Number', application.phone_number)
  end
  
  def contact_phone_time
    standard_wrapper('Best time to contact', application.contact_phone_time)
  end
  
  def email
    standard_wrapper('Email', application.email)
  end
  
  def other_ways
    standard_wrapper('Interested in', application.other_ways)
  end
  
  def previous_first_name
    standard_wrapper('Previous First Name', application.applicant.previous_first_name)
  end

  def previous_last_name
    standard_wrapper('Previous Last Name', application.applicant.previous_last_name)
  end
  
  def date_of_name_change
    standard_wrapper('Date of Name Change', application.applicant.date_changed&.to_s(:long))
  end
  
  def primary_language
    standard_wrapper('Primary language', application.primary_language)
  end
  
  def secondary_languages
    standard_wrapper('Secondary languages', application.secondary_languages)
  end
  
  def religion
    religion = if application.religious
                 application.religion
               else
                 'No religion'
               end
    
    standard_wrapper('Religion', religion)
  end
  
  def practicing
    standard_wrapper('Practicing?', value_from(application.practicing))
  end
  
  def employment_type
    standard_wrapper('Employment type', application.employment_type)
  end
  
  def ni_number
    standard_wrapper('National Insurance number', application.ni_number)
  end
  
  def occupation
    standard_wrapper('Occupation', application.occupation)
  end
  
  def employer
    standard_wrapper('Employer', application.employer)
  end
  
  def employer_contact_name
    standard_wrapper('Employer contact', application.employer_contact_name)
  end
  
  def employer_phone_number
    standard_wrapper('Employer phone number', application.employer_phone_number)
  end
  
  def where_breed_pets
    standard_wrapper('Where breeding takes place', application.where_breed_pets)
  end
  
  def offspring_kept
    standard_wrapper('Where offspring are kept', application.offspring_kept)
  end
  
  def breeding_risks
    standard_wrapper('Actions to be taken to mitigate risk', application.breeding_risks)
  end
  
  def breeding_other
    standard_wrapper('Other information', application.breeding_other)
  end
  
  def court_date
    standard_wrapper('Court date', application.court_date&.to_s(:long))
  end
  
  def court_name
    standard_wrapper('Court name', application.court_name)
  end
  
  def type_of_order
    standard_wrapper('Type of order made', application.type_of_order)
  end
  
  def parties_involved
    standard_wrapper('Parties involved', application.parties_involved)
  end
  
  def court_details
    standard_wrapper('Details', application.court_details)
  end
  
  def application_date
    standard_wrapper('Application date', application.application_date&.to_s(:long))
  end
  
  def agency_name
    standard_wrapper('Agency name', application.agency_name)
  end
  
  def agency_address
    standard_wrapper('Agency address', application.agency_address.full_address)
  end
  
  def type_of_application
    standard_wrapper('Type of application', application.type_of_application)
  end
  
  def application_outcome
    standard_wrapper('Application outcome', application.application_outcome)
  end
  
  def other_application_date
    standard_wrapper('Application date', application.other_application_date&.to_s(:long))
  end
  
  def other_agency_name
    standard_wrapper('Agency name', application.other_agency_name)
  end
  
  def other_agency_address
    standard_wrapper('Agency address', application.other_agency_address.full_address)
  end
  
  def other_type_of_application
    standard_wrapper('Type of application', application.other_type_of_application)
  end
  
  def other_application_outcome
    standard_wrapper('Application outcome', application.other_application_outcome)
  end
  
  def previous_agency_name
    standard_wrapper('Previous agency name', application.previous_agency_name)
  end
  
  def previous_agency_address
    standard_wrapper('Previous agency address', application.previous_agency_address.full_address)
  end
    
end
