require 'rails_helper'

RSpec.describe Application, type: :model do
  
  let(:application) { Fabricate(:application) }
  
  it 'has children and adults' do
    children = Fabricate.times(3, :child)
    adults = Fabricate.times(2, :person)
    children_elsewhere = Fabricate.times(1, :child)

    application.children = children
    application.adults = adults
    application.children_elsewhere = children_elsewhere
    application.save
    
    expect(application.children.count).to eq(3)
    expect(application.children).to eq(children)
    
    expect(application.adults.count).to eq(2)
    expect(application.adults).to eq(adults)
    
    expect(application.children_elsewhere.count).to eq(1)
    expect(application.children_elsewhere).to eq(children_elsewhere)
  end
  
end
