class PetsRule < ApplicationRule
  def process
    @next_step = params['application']['have_pets'] == '0' ? :breed_pets : :number_of_pets 
  end
end
