module Applications
  class PeopleController < MainController
    expose :application
    
    def new
      redirect_to path
    end
    
  end
end
