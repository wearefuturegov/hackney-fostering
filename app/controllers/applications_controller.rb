class ApplicationsController < MainController
  expose :application, :get_application
  
  prepend_before_action :update_application
  before_action :set_current_path, only: [:show]
  before_action :authenticate_user_login!, unless: -> { %w[eligibility applications].include?(controller_name) }
  append_before_action :check_application!, unless: -> { %w[eligibility applications].include?(controller_name) }
  
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
    redirect_to wizard_path(steps.first, application_id: application.code)
  end
  
  def create
    redirect_to new_application_eligibility_path(application_id: application.code) if application.save
  end
    
  private
  
  def update_application
    return unless params[:application]
    @valid = application.update_attributes(permitted_params)
  end
  
  def get_application # rubocop:disable Naming/AccessorMethodName
    if params[:application_id]
      Application.friendly.find(params[:application_id])
    else
      Application.create
    end
  end
  
end
