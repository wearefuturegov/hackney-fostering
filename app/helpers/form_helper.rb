module FormHelper
  def setup_application(application)
    application.applicant ||= Person.new
    application.address ||= Address.new
    application.addresses.build if application.addresses.blank?
    application
  end
  
  def get_options(form, question)
    form.object.class.send(question['name'].to_s.pluralize).keys
  end
end
