module Applications
  module Children
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.children.find(params[:child_id]) }
    end
  end
end
