module Applications
  class FormController < MainController
    include Incredible::Wizard
    expose :application

    form 'application'

    def show
      render_wizard nil, template: "shared/#{template}"
    end
    
    def update
      application.update_attributes(permitted_params)
      render_wizard application
    end
    
    def new
      redirect_to wizard_path(steps.first, application_id: application.id)
    end
    
    private
    
    def permitted_params
      params.require(:application).permit(
        :type_of_fostering,
        :spare_room,
        :other_ways,
        :postcode,
        :practicing,
        applicant_attributes: %i[first_name last_name],
        address_attributes: %i[postcode],
        addresses_attributes: %i[postcode date_from]
      )
    end
  
  end
end
