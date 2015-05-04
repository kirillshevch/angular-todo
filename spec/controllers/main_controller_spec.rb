require 'rails_helper'

RSpec.describe MainController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders layouts/application' do
      get :index
      expect(response).to render_template 'layouts/application'
    end
  end

end
