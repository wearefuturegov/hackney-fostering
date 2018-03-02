require 'rails_helper'

describe FosterChecksController, type: :controller do
  
  describe 'POST create' do
    let(:subject) { post(:create) }
    
    it 'creates a foster check' do
      subject
      expect(FosterCheck.count).to eq(1)
    end
    
  end
  
end
