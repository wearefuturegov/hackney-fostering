class ApplicationsController < MainController
  expose :application, :get_application
  
  prepend_before_action :update_application
  before_action :set_current_path, only: [:show]
  before_action :authenticate_user_login!, unless: -> { %w[eligibility applications].include?(controller_name) }
  
  def index; end
  
  def show
    render_wizard nil, template: "applications/#{template}"
  end
  
  def update
    if application.valid?
      render_wizard application
    else
      render "applications/#{template}"
    end
  end
  
  def new
    redirect_to wizard_path(steps.first)
  end
  
  def create
    return unless application.save
    session[:application_id] = application.id
    redirect_to new_applications_eligibility_path
  end
    
  private
  
  def update_application
    return unless params[:application]
    @valid = application.update_attributes(permitted_params)
  end
  
  def get_application # rubocop:disable Naming/AccessorMethodName
    if current_user_login
      current_user_login.application
    elsif session[:application_id]
      Application.find(session[:application_id])
    else
      Application.create
    end
  end
  
end
