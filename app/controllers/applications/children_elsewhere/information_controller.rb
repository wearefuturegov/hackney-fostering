module Applications
  module ChildrenElsewhere
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.children_elsewhere.find(params[:children_elsewhere_id]) }
    end
  end
end
