module FormHelper
  def setup_application(application) # rubocop:disable Metrics/AbcSize
    application.applicant ||= Applicant.new
    application.address ||= Address.new
    application.agency_address ||= Address.new
    application.other_agency_address ||= Address.new
    application.previous_agency_address ||= Address.new
    application.support_carer ||= SupportCarer.new

    application.addresses.build if application.addresses.blank?
    application
  end
  
  def setup_user(user_login)
    user_login.user ||= Applicant.new
    user_login
  end
  
  def get_options(form, question)
    form.object.class.send(question['name'].to_s.pluralize).keys.map do |k|
      [form.object.class.human_enum_name(question['name'].to_s, k), k]
    end
  end
end
