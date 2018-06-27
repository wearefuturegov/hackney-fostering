require 'rails_helper'

describe Applications::EligibilityController, type: :controller do
  
  let(:application) { Fabricate(:application) }
  
  describe 'show' do
    
    it 'does not save the current path' do
      get :show, params: { id: :contact_phone_time }
      application.reload
      expect(application.current_path).to eq(nil)
    end
    
  end
  
end
