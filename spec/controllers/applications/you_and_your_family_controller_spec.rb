require 'rails_helper'

describe Applications::YouAndYourFamilyController, type: :controller do
  
  let(:application) { Fabricate(:application) }
  
  describe 'show' do
    
    it 'saves the current path' do
      get :show, params: { application_id: application.code, id: :dob }
      application.reload
      expect(application.current_path).to eq("/applications/#{application.code}/you_and_your_family/dob")
    end
    
  end
  
end
