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
    
    def permitted_params # rubocop:disable Metrics/MethodLength
      params.require(:foster_check).permit(
        :what_is_your_name,
        :gender,
        :dob,
        :day,
        :month,
        :year,
        :size,
        :neutered,
        :are_you_practicing,
        :what_do_you_practice,
        :relationship,
        :language,
        :nationality,
        :practicing,
        :non_practicing,
        :type_of_fostering,
        :spare_room,
        :other_ways,
        :good_time_to_contact,
        :over_21,
        :experience,
        :ages,
        :housing,
        :like_to_be_in_touch,
        :section,
        :sub_section,
        :name,
        :last_name,
        :postcode,
        :email,
        :phone_number
      )
    end
  
  end
end
