require 'rails_helper'

RSpec.describe Application, type: :model do
  
  let(:application) { Fabricate(:application) }
  
  it 'has children and adults' do
    children = Fabricate.times(3, :person)
    adults = Fabricate.times(2, :person)
    application.children = children
    application.adults = adults
    application.save
    
    expect(application.children.count).to eq(3)
    expect(application.children).to eq(children)
    
    expect(application.adults.count).to eq(2)        
    expect(application.adults).to eq(adults)
  end
  
end
