module Applications
  class LegalHistoryController < ApplicationsController
    include Incredible::Wizard
    layout 'main_application'

    form 'legal_history'

    private

    def permitted_params # rubocop:disable Metrics/MethodLength
      params.require(:application).permit(
        :family_court,
        :court_date,
        :court_name,
        :type_of_order,
        :parties_involved,
        :court_details,
        :previous_applications,
        :application_date,
        :agency_name,
        :type_of_application,
        :application_outcome,
        :other_previous_applications,
        :other_application_date,
        :other_agency_name,
        :other_type_of_application,
        :other_application_outcome,
        :previous_fostering,
        :previous_agency_name,
        agency_address_attributes: %i[line_1 line_2 line_3 post_town postcode],
        other_agency_address_attributes: %i[line_1 line_2 line_3 post_town postcode],
        previous_agency_address_attributes: %i[line_1 line_2 line_3 post_town postcode]
      )
    end
  end
end
