module Applications
  module Children
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.children.find(params[:child_id]) }
      
      form 'children'
    end
  end
end
