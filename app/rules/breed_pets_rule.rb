# class BreedPetsRule < ApplicationRule
#   def process
#     @next_step = :where_breed_pets if params[:application][:breed_pets] == '1'
#     @redirect = new_application_referee_path(application_id: application.code) if params[:application][:breed_pets] == '0'
#   end
# end
