class AdultsElsewhereRule < ApplicationRule
  def process
    @next_step = adults_living_elsewhere == 'false' ? :pets : :adults_living_elsewhere
  end
  
  def adults_living_elsewhere
    params['application']['adults_living_elsewhere']
  end
end
