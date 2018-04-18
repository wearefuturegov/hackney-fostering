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
  
  describe 'progress' do
    
    let(:application) { Fabricate(:blank_application) }
    
    describe '#about_you_complete?' do
      
      context 'returns false' do
        
        it 'when no religion questions answered' do
          expect(application.about_you_complete?).to eq(false)
        end
        
        it 'when religious is true, but religion is blank' do
          application.religious = true
          expect(application.about_you_complete?).to eq(false)
        end
        
      end
      
      context 'returns true' do
        
        it 'when religious questions are complete' do
          application.religious = true
          application.religion = 'Muslim'
          expect(application.about_you_complete?).to eq(true)
        end
        
        it 'when no religion' do
          application.religious = false
          expect(application.about_you_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#working_experience_complete?' do
      
      context 'returns false' do
        
        it 'when no questions are answered' do
          expect(application.working_experience_complete?).to eq(false)
        end
        
        it 'when employed' do
          application.employment_type = :full_time
          expect(application.working_experience_complete?).to eq(false)
        end
        
      end
      
      context 'returns true' do
          
        it 'when unemployed' do
          application.employment_type = :unemployed
          expect(application.working_experience_complete?).to eq(true)
        end
        
        it 'when employed' do
          application.employment_type = :full_time
          application.employer_phone_number = '123456'
          expect(application.working_experience_complete?).to eq(true)
        end
      
      end
      
    end
    
    describe '#address_history_complete?' do
      
      context 'returns false' do
        
        it 'when no questions are answered' do
          expect(application.address_history_complete?).to eq(false)
        end
        
        it 'when current address is less than 5 years' do
          application.address = Fabricate(:address, date_from: Date.today - 2.years)
          expect(application.address_history_complete?).to eq(false)
        end
        
        it 'when total address history is less than 5 years' do
          application.address = Fabricate(:address, date_from: Date.today - 2.years)
          application.addresses << Fabricate(:address, date_from: Date.today - 1.years)
          application.addresses << Fabricate(:address, date_from: Date.today - 1.years)
          expect(application.address_history_complete?).to eq(false)
        end
        
      end
      
      context 'returns true' do
        
        it 'when current address is more than 5 years' do
          application.address = Fabricate(:address, date_from: Date.today - 7.years)
          expect(application.address_history_complete?).to eq(true)
        end
        
        it 'when total address history is more than 5 years' do
          application.address = Fabricate(:address, date_from: Date.today - 2.years)
          application.addresses << Fabricate(:address, date_from: Date.today - 3.years)
          application.addresses << Fabricate(:address, date_from: Date.today - 1.years)
          expect(application.address_history_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#family_complete?' do
      
      context 'returns false' do
        
        it 'when no questions are answered' do
          expect(application.family_complete?).to eq(false)
        end
        
        it 'when no adults elsewhere have been added' do
          application.adults_living_elsewhere = true
          expect(application.family_complete?).to eq(false)
        end
        
      end
      
      context 'returns true' do
        
        it 'when adults_living_elsewhere is false' do
          application.adults_living_elsewhere = false
          expect(application.family_complete?).to eq(true)
        end
        
        it 'when adults elsewhere have been added' do
          application.adults_living_elsewhere = true
          application.adults_elsewhere = Fabricate.times(3, :adult_elsewhere)
          expect(application.family_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#pets_complete?' do
      
      context 'returns false' do
            
        it 'when no questions have been answered' do
          expect(application.pets_complete?).to eq(false)
        end
        
        it 'when pet information is not complete' do
          application.have_pets = true
          expect(application.pets_complete?).to eq(false)
        end
                  
      end
      
      context 'returns true' do
        
        it 'when no pets' do
          application.have_pets = false
          expect(application.pets_complete?).to eq(true)
        end
        
        it 'when pet information is complete' do
          application.have_pets = true
          application.pet_type = 'Guinea Pig'
          expect(application.pets_complete?).to eq(true)
        end
                  
      end
      
    end
    
    describe '#you_and_your_family_complete?' do
      
      context 'returns false' do
        
        it 'when no subsections are complete' do
          expect(application.you_and_your_family_complete?).to eq(false)
        end
        
        it 'when some sections are complete' do
          expect(application).to receive(:about_you_complete?) { true }
          expect(application).to receive(:working_experience_complete?) { true }
          expect(application.you_and_your_family_complete?).to eq(false)
        end
        
      end
      
      context 'returns true' do
        
        it 'when all subsections are complete' do
          expect(application).to receive(:about_you_complete?) { true }
          expect(application).to receive(:working_experience_complete?) { true }
          expect(application).to receive(:address_history_complete?) { true }
          expect(application).to receive(:family_complete?) { true }
          expect(application).to receive(:pets_complete?) { true }
          expect(application.you_and_your_family_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#support_carer_complete?' do
      
      describe 'returns false' do
        
        it 'when no support carer' do
          expect(application.support_carer_complete?).to eq(false)
        end
        
        it 'when support carer details are incomplete' do
          application.support_carer = Fabricate(:support_carer, email: '')
          expect(application.support_carer_complete?).to eq(false)
        end
        
      end
      
      describe 'returns true' do
        
        it 'when support carer details are complete' do
          application.support_carer = Fabricate(:support_carer, email: 'foo@bar.com')
          expect(application.support_carer_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#references_complete?' do
      
      describe 'returns false' do
        
        it 'when there are no referees' do
          expect(application.references_complete?).to eq(false)
        end
        
        it 'when there are not enough referees' do
          application.referees = Fabricate.times(3, :referee)
          expect(application.references_complete?).to eq(false)
        end
        
      end
      
      describe 'returns true' do
        
        it 'when there are enough referees' do
          application.referees = Fabricate.times(6, :referee)
          expect(application.references_complete?).to eq(true)
        end
        
      end
      
    end
    
    describe '#legal_history_complete?' do
      
      describe 'returns false' do
        
        it 'when no questions have been answered' do
          expect(application.legal_history_complete?).to eq(false)
        end
        
        it 'when previous fostering questions are unanswered' do
          application.previous_fostering = true
          expect(application.legal_history_complete?).to eq(false)
        end
        
      end
      
      describe 'returns true' do
        
        it 'when no previous fostering experience' do
          application.previous_fostering = false
          expect(application.legal_history_complete?).to eq(true)
        end
        
        it 'when previous fostering questions are answered' do
          application.previous_fostering = true
          application.previous_agency_address = Fabricate.build(:address)
          expect(application.legal_history_complete?).to eq(true)
        end
        
      end
      
    end
    
    
  end
    
end
