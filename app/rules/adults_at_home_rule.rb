class AdultsAtHomeRule < ApplicationRule
  def process
    @next_step = adults_living_at_home == 'false' ? :adults_elsewhere : :adults_living_at_home
  end
  
  def adults_living_at_home
    params['application']['adults_living_at_home']
  end
end
