module Applications
  module ChildrenElsewhere
    class InformationController < Applications::Children::InformationController
      include Incredible::Wizard      
      expose :child, -> { application.children_elsewhere.find(params[:children_elsewhere_id]) }
    end
  end
end
