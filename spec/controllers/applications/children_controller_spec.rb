require 'rails_helper'

module Applications
  describe ChildrenController, type: :controller do
    
    let(:application) { Fabricate(:application) }
    
    describe 'GET new' do
      let(:subject) { get(:new, params: { application_id: application.id }) }
      
      it 'creates a child' do
        subject
        expect(application.children.count).to eq(1)
      end
      
      it 'redirects to the form' do
        subject
        url = new_application_child_information_path(application_id: application.code, child_id: application.children.first.id)
        expect(response.location).to match(url)
      end
    end
    
  end
end
