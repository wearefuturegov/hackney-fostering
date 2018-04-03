require 'rails_helper'

module Applications
  describe ChildrenElsewhereController, type: :controller do
    
    let(:application) { Fabricate(:application) }
    
    describe 'GET new' do
      let(:subject) { get(:new, params: { application_id: application.id }) }
      
      it 'creates a child' do
        subject
        expect(application.children_elsewhere.count).to eq(1)
      end
      
      it 'redirects to the form' do
        subject
        url = new_application_children_elsewhere_information_path(
          application_id: application.code,
          children_elsewhere_id: application.children_elsewhere.first.id
        )
        expect(response.location).to match(url)
      end
    end
    
  end
end
