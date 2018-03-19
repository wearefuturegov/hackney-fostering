module Applications
  module Adults
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.adults.find(params[:adult_id]) }
      
      form 'adults'
    end
  end
end
