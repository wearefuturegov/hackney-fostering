module Applications
  module Pets
    class InformationController < MainController
      include Incredible::Wizard
      expose :application, -> { Application.friendly.find(params[:application_id]) }
      expose :pet, -> { application.pets.find(params[:pet_id]) }
      skip_before_action :load_next_step, unless: :valid?

      form 'pets'
      
      prepend_before_action :update_pet
      
      def show
        render_wizard nil, template: "pets/#{template}"
      end
      
      def update
        if pet.valid?
          render_wizard pet
        else
          render "pets/#{template}"
        end
      end
      
      def new
        redirect_to wizard_path(steps.first, pet_id: pet.id)
      end
      
      private
      
      def update_pet
        @valid = pet.update_attributes(permitted_params) if params[:pet]
      end
      
      def permitted_params # rubocop:disable Metrics/MethodLength
        params.require(:pet).permit(
          :pet_type,
          :size,
          :neutered,
          :application_id,
          :age,
          :where_allowed,
          :areas,
          :sleeping_area,
          :feeding_area,
          :safe_around_food,
          :temperament,
          :toilet,
          :bitten_or_hurt,
          :bitten_or_hurt_detail,
          :vet,
          :vaccinations,
          :children_experience,
          :conflict,
          :conflict_resolution
        )
      end
    end
  end
end
