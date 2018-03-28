class MainController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_path, only: [:show]
  
  def index; end
  
  def set_current_path
    return unless defined?(application)
    application.update_attribute(:current_path, request.path)
  end
  
end
