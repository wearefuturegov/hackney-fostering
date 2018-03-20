require 'rails_helper'

RSpec.describe Application, type: :model do # rubocop:disable Metrics/BlockLength
  
  let(:application) { Fabricate(:application) }
  
  describe 'people relationships' do # rubocop:disable Metrics/BlockLength
    
    let(:children) { Fabricate.times(3, :child) }
    let(:adults) { Fabricate.times(2, :person) }
    let(:children_elsewhere) { Fabricate.times(1, :child) }
    let(:adults_elsewhere) { Fabricate.times(6, :child) }

    let(:application) do
      Fabricate(:application,
                children: children,
                adults: adults,
                children_elsewhere: children_elsewhere,
                adults_elsewhere: adults_elsewhere)
    end
    
    it 'has children' do
      expect(application.children.count).to eq(3)
      expect(application.children).to eq(children)
    end
    
    it 'has adults' do
      expect(application.adults.count).to eq(2)
      expect(application.adults).to eq(adults)
    end
    
    it 'has children elewhere' do
      expect(application.children_elsewhere.count).to eq(1)
      expect(application.children_elsewhere).to eq(children_elsewhere)
    end
    
    it 'has adults elewhere' do
      expect(application.adults_elsewhere.count).to eq(6)
      expect(application.adults_elsewhere).to eq(adults_elsewhere)
    end
    
  end
  
  it 'generates a code' do
    application.reload
    expect(application.code.length).to eq(6)
  end
    
end
