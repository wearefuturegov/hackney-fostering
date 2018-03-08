module FormHelper
  def setup_application(application)
    application.applicant ||= Person.new
    application.address ||= Address.new
    application.addresses.build if application.addresses.blank?
    application
  end
end
