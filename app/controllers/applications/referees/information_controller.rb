module Applications
  module Referees
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.referees.find(params[:referee_id]) }
      
      form 'referees'
    end
  end
end
