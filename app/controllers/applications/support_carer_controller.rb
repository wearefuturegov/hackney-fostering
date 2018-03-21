module Applications
  class SupportCarerController < ApplicationsController
    include Incredible::Wizard
    expose :support_carer, -> { application.support_carer }
    
    form 'support_carers'
    
    private
    
    def permitted_params
      params.require(:application).permit(
        support_carer_attributes: %i[first_name last_name email]
      )
    end

  end
end
