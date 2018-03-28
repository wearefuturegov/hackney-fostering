class ApplicationsController < MainController
  expose :application, :get_application
  
  prepend_before_action :update_application
  before_action :set_current_path, only: [:show]
  
  def index; end
  
  def show
    render_wizard nil, template: "applications/#{template}"
  end
  
  def update
    render_wizard application
  end
  
  def new
    redirect_to wizard_path(steps.first, application_id: application.code)
  end
  
  def create
    redirect_to new_application_eligibility_path(application_id: application.code) if application.save
  end
  
  def find
    redirect_to new_application_you_and_your_family_path(application)
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t('application.invalid_code')
    render :index
  end
  
  def consent; end
  
  def complete
    ApplicationsMailer.application(params[:id]).deliver
  end
    
  private
  
  def update_application
    application.update_attributes(permitted_params) if params[:application]
  end
  
  def get_application # rubocop:disable Naming/AccessorMethodName
    if params[:application_id]
      Application.friendly.find(params[:application_id])
    else
      Application.create
    end
  end
  
  def permitted_params
    params.require(:application).permit(
      :agree_to_checks, :agree_to_la_contact, :signature
    )
  end
  
end
