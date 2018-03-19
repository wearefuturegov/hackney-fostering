module Applications
  module Adults
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :application
      expose :person, -> { application.adults.find(params[:adult_id]) }
    end
  end
end
