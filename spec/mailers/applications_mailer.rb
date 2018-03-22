require 'rails_helper'

RSpec.describe ApplicationsMailer, type: :mailer do # rubocop:disable Metrics/BlockLength
  describe 'eligibility' do # rubocop:disable Metrics/BlockLength
    
    let(:mail) { ApplicationsMailer.eligibility(application.id) }

    context 'when eligible' do
      let(:application) { Fabricate(:application, eligible: true) }

      it 'renders the headers' do
        expect(mail.subject).to eq('New eligibility enquiry')
        expect(mail.to).to eq(['fostering@hackney.gov.uk'])
        expect(mail.from).to eq(['fostering@hackney.gov.uk'])
      end

      it 'renders the body' do
        expect(mail.body.encoded).to match(application.applicant.first_name)
        expect(mail.body.encoded).to match(application.applicant.last_name)
        expect(mail.body.encoded).to match(application.phone_number)
        expect(mail.body.encoded).to match(application.email)
        expect(mail.body.encoded).to match(application.best_way_to_contact)
        expect(mail.body.encoded).to match(application.contact_phone_time)
        expect(mail.body.encoded).to match(application.type_of_fostering)
        expect(mail.body.encoded).to match(application.spare_room)
        expect(mail.body.encoded).to match('Yes')
        expect(mail.body.encoded).to match(application.experience)
        expect(mail.body.encoded).to match(application.code)
      end
    end
    
    context 'ineligible' do
      
      let(:application) { Fabricate(:application, eligible: false, other_ways: 1) }
      
      it 'renders the correct body' do
        expect(mail.body.encoded).to match('They were not eligible to foster, but would like to be contacted.')
      end
      
    end
  
  end
end
