require 'rails_helper'

RSpec.describe UserLogin, type: :model do
  
  it 'can have an applicant' do
    applicant = Fabricate.create(:applicant_with_email)
    login = Fabricate.create(:user_login, user: applicant)
    expect(login.user).to eq(applicant)
  end
  
end
