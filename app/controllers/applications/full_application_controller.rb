module Applications
  class FullApplicationController < ApplicationsController
    include Incredible::Wizard
    expose :application

    form 'full_application'
    
    private
    
    def permitted_params
      params.require(:application).permit(
        :name_change
      )
    end
    
  end
end
