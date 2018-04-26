class ApplicationRule < Incredible::Rule
  include Rails.application.routes.url_helpers
  include Devise::Controllers::Helpers
  
  def application
    @application ||= if current_user_login
                       current_user_login.application
                     else
                       Application.find(request.session[:application_id])
                     end
  end
end
