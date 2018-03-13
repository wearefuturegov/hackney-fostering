module Applications
  class FullApplicationController < ApplicationsController
    include Incredible::Wizard
    expose :application

    form 'full_application'
    
    append_before_action :setup_model, only: [:show]
    
    def setup_model
      @model = step_data.instance_variable_get('@data')[:model]
    end
    
    private
    
    def permitted_params
      params.require(:application).permit(
        :name_change,
        address_attributes: %i[line_1 line_2 line_3 post_town postcode date_from]
      )
    end
    
  end
end
