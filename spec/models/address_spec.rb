require 'rails_helper'

RSpec.describe Address, type: :model do
  
  describe '#full_address' do
    let(:address) do
      Fabricate(:address, line_1: '123 Fake Street', line_2: '', line_3: '', post_town: 'Faketown', postcode: 'FAKE123')
    end
    
    it 'joins address elements' do
      expect(address.full_address).to eq('123 Fake Street, Faketown, FAKE123')
    end
  end
  
end
