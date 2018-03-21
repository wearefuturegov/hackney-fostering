module FormHelper
  def setup_application(application)
    application.applicant ||= Person.new
    application.address ||= Address.new
    application.agency_address ||= Address.new
    application.other_agency_address ||= Address.new
    application.previous_agency_address ||= Address.new

    application.addresses.build if application.addresses.blank?
    application
  end
  
  def setup_person(person)
    person.address ||= Address.new
    person
  end
  
  def get_options(form, question)
    form.object.class.send(question['name'].to_s.pluralize).keys
  end
end
