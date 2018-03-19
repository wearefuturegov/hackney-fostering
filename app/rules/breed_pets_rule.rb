class BreedPetsRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:breed_pets] == '1' ? :where_breed_pets : :dunno
  end
  
end
