module Applications
  module AdultsElsewhere
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.adults_elsewhere.find(params[:adults_elsewhere_id]) }
      
      form 'adults'
    end
  end
end
