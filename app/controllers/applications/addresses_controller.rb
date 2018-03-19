module Applications
  class AddressesController < MainController
    expose :application
    expose :address
        
    def edit
      render 'addresses/edit'
    end
    
    def create
      address = application.addresses.create(address_params)
      if address.years_ago >= 5
        redirect_to application_full_application_path(application_id: application.id, id: :your_family)
      else
        redirect_to application_full_application_path(application_id: application.id, id: :previous_addresses)
      end
    end
    
    def update
      address.update_attributes(address_params)
      redirect_to application_full_application_path(application_id: application.id, id: :previous_addresses)
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
