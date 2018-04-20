module Applications
  class EligibilityController < ApplicationsController
    include Incredible::Wizard

    form 'eligibility'

    private

    def permitted_params # rubocop:disable Metrics/MethodLength
      params.require(:application).permit(
        :spare_room,
        :over_21,
        :experience,
        :age_experience,
        :housing_type,
        :be_in_touch,
        :contacting_you,
        :phone_number,
        :other_ways,
        :postcode,
        :practicing,
        type_of_fostering: [],
        age_experience: [],
        contact_phone_time: [],
        applicant_attributes: %i[first_name last_name email],
        address_attributes: %i[postcode],
        addresses_attributes: %i[postcode date_from]
      )
    end

    # Don't set the current path in the eligibility questionnaire
    def set_current_path; end
  end
end
