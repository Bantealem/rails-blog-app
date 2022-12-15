require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'GET/index' do
    before :each do
      get '/users'
    end
    it 'is a success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'Should return the correct placeholder' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET/show' do
    before :each do
      get '/users/:id'
    end
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
    it 'Should return the correct placeholder' do
      expect(response.body).to include('User')
    end
  end
end
