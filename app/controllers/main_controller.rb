class MainController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_path, :set_current_step, only: [:show]
  
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
  
end
