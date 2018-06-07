class MainController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cache_headers, :set_current_path, :set_current_step, only: [:show]
  
  def index; end
  
  def set_current_path
    return unless defined?(application)
    application.update_attribute(:current_path, request.path)
  end
  
  def set_current_step
    return unless defined?(application)
    application.update_attribute(:current_step, params[:id])
  end
  
  def valid?
    @valid
  end
  
  def after_sign_in_path_for(user_login)
    user_login.application.current_path || new_applications_you_and_your_family_path
  end
  
  private
  
  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
    
end
