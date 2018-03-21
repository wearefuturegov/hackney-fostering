require 'rails_helper'

describe PagesController, type: :controller do
  
  describe 'GET show' do
    
    it 'returns 200 when a template exists' do
      expect(get(:show, params: { id: :fostering })).to have_http_status(200)
    end
    
    it 'returns 404 when a template does not exist' do
      expect { get(:show, params: { id: :sfdssdfds }) }.to raise_error(ActionController::RoutingError)
    end
    
  end
  
end
