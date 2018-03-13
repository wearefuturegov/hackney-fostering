module Applications
  class AddressesController < MainController
    expose :address
        
    def edit
      render 'addresses/edit'
    end
    
    def update
      address.update_attributes(address_params)
      redirect_to application_full_application_path(application_id: address.application.id, id: :previous_addresses)
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
