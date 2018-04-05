require 'rails_helper'

RSpec.describe Application, type: :model do
  
  let(:application) { Fabricate(:application) }
  let(:address) { Fabricate(:address) }

  describe 'people relationships' do
    
    let(:children) { Fabricate.times(3, :child) }
    let(:adults) { Fabricate.times(2, :adult) }
    let(:children_elsewhere) { Fabricate.times(1, :child_elsewhere) }
    let(:adults_elsewhere) { Fabricate.times(6, :adult_elsewhere) }
    let(:referees) { Fabricate.times(6, :referee) }

    let(:application) do
      Fabricate(:application,
                children: children,
                adults: adults,
                children_elsewhere: children_elsewhere,
                adults_elsewhere: adults_elsewhere,
                referees: referees)
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
    
    it 'has referees' do
      expect(application.referees.count).to eq(6)
      expect(application.referees).to eq(referees)
    end
    
  end
  
  it 'generates a code' do
    application.reload
    expect(application.code.length).to eq(6)
  end
  
  it 'has an agency address' do
    application.agency_address = address
    application.save
    application.reload
    expect(application.agency_address).to eq(address)
  end
  
  it 'has an other agency address' do
    application.other_agency_address = address
    application.save
    application.reload
    expect(application.other_agency_address).to eq(address)
  end
  
  it 'has a previous agency address' do
    application.previous_agency_address = address
    application.save
    application.reload
    expect(application.previous_agency_address).to eq(address)
  end
  
  describe 'parsing dates' do
    
    let(:application) { Fabricate(:application) }
    
    it 'returns invalid error if date is invalid' do
      valid = application.update_attributes('current_step' => 'court_date',
                                            'court_date(1i)' => '9999',
                                            'court_date(2i)' => '99',
                                            'court_date(3i)' => '99')
      expect(valid).to eq(false)
    end
    
    it 'returns valid if date is valid' do
      valid = application.update_attributes('current_step' => 'court_date',
                                            'court_date(1i)' => '2012',
                                            'court_date(2i)' => '12',
                                            'court_date(3i)' => '12')
      expect(valid).to eq(true)
    end
    
    context 'with nested attribute' do
      
      it 'returns invalid error if date is invalid' do
        valid = application.update_attributes('current_step' => 'dob',
                                              'applicant_attributes' => {
                                                'date_of_birth(1i)' => '9999',
                                                'date_of_birth(2i)' => '99',
                                                'date_of_birth(3i)' => '99'
                                              })
        expect(valid).to eq(false)
      end
      
      it 'returns valid if date is valid' do
        valid = application.update_attributes('current_step' => 'dob',
                                              'applicant_attributes' => {
                                                'date_of_birth(1i)' => '2012',
                                                'date_of_birth(2i)' => '12',
                                                'date_of_birth(3i)' => '12'
                                              })
        expect(valid).to eq(true)
      end
      
    end
    
  end
    
end
