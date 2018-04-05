class AdultsElsewhereRule < ApplicationRule
  def process
    @next_step = adults_living_elsewhere == '0' ? :pets : :adults_living_elsewhere
  end
  
  def adults_living_elsewhere
    params['application']['adults_living_elsewhere']
  end
end
