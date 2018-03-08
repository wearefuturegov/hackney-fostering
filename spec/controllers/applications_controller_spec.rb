require 'rails_helper'

describe ApplicationsController, type: :controller do
  
  describe 'POST create' do
    let(:subject) { post(:create) }
    
    it 'creates an application' do
      subject
      expect(Application.count).to eq(1)
    end
    
  end
  
end
