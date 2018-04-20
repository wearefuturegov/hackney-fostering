module Applications
  class AddressesController < MainController
    expose :application, -> { Application.friendly.find(params[:application_id]) }
    expose :address
    
    before_action :authenticate_user_login!
    append_before_action :check_application!
        
    def edit
      render 'addresses/edit'
    end
    
    def create
      address = application.addresses.create(address_params)
      if address.years_ago >= 5
        redirect_to application_you_and_your_family_path(application_id: application.code, id: :your_family)
      else
        redirect_to application_you_and_your_family_path(application_id: application.code, id: :previous_addresses)
      end
    end
    
    def update
      address.update_attributes(address_params)
      redirect_to application_you_and_your_family_path(application_id: application.code, id: :previous_addresses)
    end

    def destroy
      address.delete
    end
    
    private
    
    def address_params
      params.require(:address).permit(
        :line_1,
        :line_2,
        :line_3,
        :post_town,
        :postcode,
        :date_from,
        :date_to
      )
    end
  end
end
