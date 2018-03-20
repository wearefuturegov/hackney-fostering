module Applications
  class EligibilityController < ApplicationsController
  layout 'main'
    include Incredible::Wizard

    form 'eligibility'
    
    private
    
    def permitted_params # rubocop:disable Metrics/MethodLength
      params.require(:application).permit(
        :type_of_fostering,
        :spare_room,
        :over_21,
        :experience,
        :age_experience,
        :housing_type,
        :be_in_touch,
        :contacting_you,
        :email,
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
