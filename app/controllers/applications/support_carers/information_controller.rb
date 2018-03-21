module Applications
  module SupportCarers
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.support_carer }
      
      form 'support_carers'
    end
  end
end
