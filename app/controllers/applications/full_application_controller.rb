module Applications
  class FullApplicationController < ApplicationsController
    include Incredible::Wizard
    expose :application

    form 'full_application'
    
    private
    
    def permitted_params
      params.require(:application).permit(
        :name_change,
        :children_at_home,
        :number_of_children,
        :children_elsewhere,
        :number_of_children_elsewhere,
        address_attributes: %i[line_1 line_2 line_3 post_town postcode date_from],
        addresses_attributes: %i[line_1 line_2 line_3 post_town postcode date_from date_to]
      )
    end
    
  end
end
