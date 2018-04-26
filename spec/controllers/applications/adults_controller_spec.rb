require 'rails_helper'

module Applications
  describe AdultsController, type: :controller do
    let(:application) { Fabricate(:application, current_step: 'adults_living_at_home', adults_living_at_home: true) }
    let(:person) { Fabricate(:adult, application: application) }
    
    login_user
    
    describe 'GET edit' do
      let(:subject) { get :edit, params: { id: person.id } }
      
      it 'renders the template' do
        expect(subject).to render_template('applications/people/edit')
      end
    end
    
    describe 'PUT update' do
      let(:subject) { put :update, params }
      
      context 'when valid' do
        
        let(:params) do
          {
            params: {
              id: person.id,
              adult: {
                first_name: 'New Name'
              }
            }
          }
        end
        
        it 'updates a person' do
          subject
          person.reload
          expect(person.first_name).to eq('New Name')
        end
        
        it 'redirects correctly' do
          expect(subject).to redirect_to(
            applications_you_and_your_family_path(id: :adults_living_at_home)
          )
        end
      end
      
      context 'when invalid' do
        let(:params) do
          {
            params: {
              id: person.id,
              adult: {
                first_name: ''
              }
            }
          }
        end
        
        it 'renders the template' do
          expect(subject).to render_template('applications/adults')
        end
      end
    end
    
    describe 'POST create' do
      let(:subject) { post :create, params }
      let!(:adult_template) { Fabricate.build(:adult) }
      
      context 'when valid' do
        
        let(:params) do
          {
            params: {
              adult: {
                first_name: adult_template.first_name,
                last_name: adult_template.last_name,
                gender: adult_template.gender,
                date_of_birth: adult_template.date_of_birth,
                relationship: adult_template.relationship
              }
            }
          }
        end
        
        it 'creates a person' do
          expect { subject }.to change { application.adults.count }.by(1)
          application.reload
          adult = application.adults.last
          expect(adult.first_name).to eq(adult_template.first_name)
          expect(adult.last_name).to eq(adult_template.last_name)
          expect(adult.gender).to eq(adult_template.gender)
          expect(adult.date_of_birth).to eq(adult_template.date_of_birth)
          expect(adult.relationship).to eq(adult_template.relationship)
        end
        
        it 'redirects correctly' do
          expect(subject).to redirect_to(
            applications_you_and_your_family_path(id: :adults_living_at_home)
          )
        end
      end
      
      context 'when invalid' do
        let(:params) do
          {
            params: {
              adult: {
                first_name: '',
                last_name: adult_template.last_name,
                gender: adult_template.gender,
                date_of_birth: adult_template.date_of_birth,
                relationship: adult_template.relationship
              }
            }
          }
        end
        
        it 'renders the template' do
          expect(subject).to render_template('applications/adults')
        end
      end
    end
    
    describe 'DELETE destroy' do
      it 'deletes an adult' do
        delete :destroy, params: { id: person.id }
        application.reload
        expect(application.adults.count).to eq(0)
      end
    end
    
  end
end
