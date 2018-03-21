module Applications
  class YouAndYourFamilyController < ApplicationsController
    include Incredible::Wizard

    form 'you_and_your_family'
    
    private
    
    def permitted_params # rubocop:disable Metrics/MethodLength
      params.require(:application).permit(
        :name_change,
        :primary_language,
        :other_language,
        :secondary_languages,
        :religious,
        :religion,
        :practicing,
        :employment_type,
        :ni_number,
        :occupation,
        :employer,
        :employer_contact_name,
        :employer_phone_number,
        :children_at_home,
        :number_of_children,
        :children_elsewhere,
        :number_of_children_elsewhere,
        :adults_living_at_home,
        :number_of_adults,
        :adults_living_elsewhere,
        :number_of_adults_elsewhere,
        :have_pets,
        :number_of_pets,
        :breed_pets,
        :where_breed_pets,
        :offspring_kept,
        :breeding_risks,
        :breeding_other,
        applicant_attributes: applicant_attributes,
        address_attributes: address_attributes,
        addresses_attributes: address_attributes + %i[date_to]
      )
    end
    
    def applicant_attributes
      %i[
        previous_first_name
        previous_last_name
        date_changed gender
        date_of_birth
        country_of_birth
        town_of_birth
        nationality
      ]
    end
    
    def address_attributes
      %i[line_1 line_2 line_3 post_town postcode date_from]
    end
    
  end
end
