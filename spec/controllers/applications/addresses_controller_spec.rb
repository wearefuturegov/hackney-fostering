require 'rails_helper'

module Applications
  describe AddressesController, type: :controller do
    let!(:application) { Fabricate(:application) }
    let!(:address) { Fabricate(:address, application: application) }
    
    describe 'DELETE destroy' do
      it 'deletes an address' do
        expect do
          delete :destroy, params: { application_id: application.id, id: address.id }
        end.to change { Address.count }.by(-1)
      end
    end
    
    describe 'PUT update' do
      it 'updates an address' do
        put :update, params: {
          application_id: application.id,
          id: address.id,
          address: {
            line_1: '123 Fake Street'
          }
        }
        
        address.reload
        expect(address.line_1).to eq('123 Fake Street')
      end
      
      it 'redirects back to the form' do
        expect(
          (put :update, params: {
            application_id: application.id,
            id: address.id,
            address: {
              line_1: '123 Fake Street'
            }
          })
        ).to redirect_to application_you_and_your_family_path(application_id: application.code, id: :previous_addresses)
      end
    end
    
  end
end
