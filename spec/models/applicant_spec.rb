require 'rails_helper'

RSpec.describe Applicant, type: :model do
  
  let(:applicant) { Fabricate.create(:applicant) }
  
  describe 'user logins' do
    let(:applicant) { Fabricate.create(:applicant_with_email) }
    
    it 'can have a login' do
      login = Fabricate.create(:user_login, user: applicant)
      applicant.reload
      expect(applicant.login).to eq(login)
    end
    
    it 'creates a user login' do
      applicant.create_user_login!
      expect(applicant.login).to_not eq(nil)
      expect(applicant.login.email).to eq(applicant.email)
    end
  end
  
end
