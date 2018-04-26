require 'rails_helper'

describe Applications::YouAndYourFamilyController, type: :controller do
  
  let(:application) { Fabricate(:application) }
  
  login_user
  
  describe 'show' do
    
    it 'saves the current path' do
      get :show, params: { id: :dob }
      application.reload
      expect(application.current_path).to eq('/applications/you_and_your_family/dob')
    end
    
  end
  
end
