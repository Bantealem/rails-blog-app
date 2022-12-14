# rubocop:disable all
require 'rails_helper'

RSpec.describe 'posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/:user_id/posts'
    end
    it 'is a success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'Should return the correct placeholder' do
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET/show' do
    before :each do
      get '/users/:user_id/posts/1'
    end
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it 'Renders the right template' do
      expect(response).to render_template(:show)
    end
    it 'Should return the correct placeholder' do
      expect(response.body).to include('Posts')
    end
  end
end
