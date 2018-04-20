require 'rails_helper'

module Applications
  describe RefereesController, type: :controller do
    let(:application) { Fabricate(:application, current_step: 'referees') }
    let(:referee) { Fabricate(:referee, application: application) }
    
    login_user
    
    describe 'GET edit' do
      let(:subject) { get :edit, params: { application_id: application.code, id: referee.id } }
      
      it 'renders the template' do
        expect(subject).to render_template('applications/referees/edit')
      end
    end
    
    describe 'PUT update' do
      let(:subject) { put :update, params }
      
      context 'when valid' do
        
        let(:params) do
          {
            params: {
              application_id: application.code,
              id: referee.id,
              referee: {
                first_name: 'New Name'
              }
            }
          }
        end
        
        it 'updates a referee' do
          subject
          referee.reload
          expect(referee.first_name).to eq('New Name')
        end
        
        it 'redirects correctly' do
          expect(subject).to redirect_to(
            application_referees_path(application_id: application.code)
          )
        end
      end
      
      context 'when invalid' do
        let(:params) do
          {
            params: {
              application_id: application.code,
              id: referee.id,
              referee: {
                first_name: ''
              }
            }
          }
        end
        
        it 'renders the template' do
          expect(subject).to render_template('applications/referees/edit')
        end
      end
    end
    
    describe 'POST create' do
      let(:subject) { post :create, params }
      let!(:referee_template) { Fabricate.build(:referee) }
      
      context 'when valid' do
        
        let(:params) do
          {
            params: {
              application_id: application.code,
              referee: {
                first_name: referee_template.first_name,
                last_name: referee_template.last_name,
                relationship: referee_template.relationship,
                email: referee_template.email,
                phone_number: referee_template.phone_number,
                line_1: referee_template.address.line_1,
                line_2: referee_template.address.line_2,
                line_3: referee_template.address.line_3,
                post_town: referee_template.address.post_town,
                postcode: referee_template.address.postcode,
                years_known: referee_template.years_known
              }
            }
          }
        end
        
        it 'creates a referee' do
          expect { subject }.to change { application.referees.count }.by(1)
          application.reload
          referee = application.referees.last
          expect(referee.first_name).to eq(referee_template.first_name)
          expect(referee.last_name).to eq(referee_template.last_name)
          expect(referee.relationship).to eq(referee_template.relationship)
          expect(referee.email).to eq(referee_template.email)
          expect(referee.phone_number).to eq(referee_template.phone_number)
          expect(referee.line_1).to eq(referee_template.line_1)
          expect(referee.line_3).to eq(referee_template.line_3)
          expect(referee.post_town).to eq(referee_template.post_town)
          expect(referee.postcode).to eq(referee_template.postcode)
        end
        
        it 'redirects correctly' do
          expect(subject).to redirect_to(
            application_referees_path(application_id: application.code)
          )
        end
      end
      
      context 'when invalid' do
        let(:params) do
          {
            params: {
              application_id: application.code,
              referee: {
                first_name: ''
              }
            }
          }
        end
        
        it 'renders the template' do
          expect(subject).to render_template('applications/referees/index')
        end
      end
    end
    
    describe 'DELETE destroy' do
      it 'deletes an adult' do
        delete :destroy, params: { application_id: application.code, id: referee.id }
        application.reload
        expect(application.adults.count).to eq(0)
      end
    end
    
  end
end
