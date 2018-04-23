require 'rails_helper'

RSpec.describe ApplicationsMailer, type: :mailer do
  describe 'eligibility' do
    
    let(:mail) { ApplicationsMailer.eligibility(application.id) }

    context 'when eligible' do
      let(:application) { Fabricate(:eligible_application) }

      it 'renders the headers' do
        expect(mail.subject).to eq('New eligibility enquiry')
        expect(mail.to).to eq([ENV['FOSTERING_EMAIL_ADDRESS']])
        expect(mail.from).to eq([ENV['FOSTERING_EMAIL_ADDRESS']])
      end

      it 'renders the body' do
        expect(mail.body.encoded).to match(application.applicant.first_name)
        expect(mail.body.encoded).to match(application.applicant.last_name)
        expect(mail.body.encoded).to match(application.phone_number)
        expect(mail.body.encoded).to match(application.applicant.email)
        expect(mail.body.encoded).to match(application.best_way_to_contact)
        expect(mail.body.encoded).to match(application.contact_phone_time.join(', '))
        expect(mail.body.encoded).to match(application.type_of_fostering.reject(&:blank?).join(', '))
        expect(mail.body.encoded).to match(application.spare_room)
        expect(mail.body.encoded).to match('Yes')
        expect(mail.body.encoded).to match(application.experience)
        expect(mail.body.encoded).to match(application.applicant.login.confirmation_token)
      end
    end
    
    context 'ineligible' do
      
      let(:application) { Fabricate(:application, eligible: false, other_ways: 1) }
      
      it 'renders the correct body' do
        expect(mail.body.encoded).to match('They were not eligible to foster, but would like to be contacted.')
      end
      
    end
  
  end
  
  describe 'application' do
    
    let(:application) { Fabricate(:complete_application, agree_to_checks: true, agree_to_la_contact: true) }
    let(:mail) { ApplicationsMailer.application(application.id) }
    
    it 'renders the headers' do
      expect(mail.subject).to eq('New fostering application')
      expect(mail.to).to eq([ENV['FOSTERING_EMAIL_ADDRESS']])
      expect(mail.from).to eq([ENV['FOSTERING_EMAIL_ADDRESS']])
    end
    
    it 'renders the body' do
      expect(mail.body.encoded).to match(application.applicant.first_name)
    end
    
    it 'adds a timestamp' do
      timestamp = application.updated_at.strftime('%I:%M%p')
      datestamp = application.updated_at.strftime('%A %m %A %Y')
      expect(mail.body.encoded).to match("The applicant agreed to checks at #{timestamp} on #{datestamp}")
      expect(mail.body.encoded).to match("The applicant agreed to be contacted at #{timestamp} on #{datestamp}")
    end
    
    context 'with pets' do
      
      let(:application) { Fabricate(:complete_application, have_pets: true, number_of_pets: 1, pet_type: 'Dog') }
      
      it 'renders the body' do
        expect(mail.body.encoded).to match(%r{Number of pets: </label>1})
        expect(mail.body.encoded).to match(%r{Pet type\(s\): </label>Dog})
      end
      
    end
    
  end
end
