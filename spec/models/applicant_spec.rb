require 'rails_helper'

RSpec.describe Applicant, type: :model do
  
  let(:applicant) { Fabricate.create(:applicant) }
  
  it 'can have a login' do
    login = Fabricate.create(:user_login, user: applicant)
    applicant.reload
    expect(applicant.login).to eq(login)
  end
  
end
