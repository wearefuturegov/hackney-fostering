module FosterChecks
  class FormController < ApplicationController
    include Incredible::Wizard
    expose :foster_check

    form 'foster_check'

    def show
      render_wizard nil, template: "shared/#{template}"
    end
    
    def update
      foster_check.update_attributes(permitted_params)
      render_wizard foster_check
    end
    
    def new
      redirect_to wizard_path(steps.first, foster_check_id: foster_check.id)
    end
    
    private
    
    def permitted_params
      params.require(:foster_check).permit(
        :type_of_fostering,
        :spare_room,
        :other_ways,
        :good_time_to_contact,
        :over_21,
        :experience,
        :ages,
        :housing,
        :like_to_be_in_touch,
        :name,
        :postcode,
        :email,
        :phone_number
      )
    end
  
  end
end
