require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  describe 'user session controller' do
    it 'get new' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'post create and delete destroy' do
      user = create(:user, username: 'doni', password: 'whatever', password_confirmation: 'whatever')
      post :create, params: {user: { login: user.login, password: 'whatever' }}
      expect(flash[:notice]).not_to be_nil

      delete :destroy
      expect(flash[:notice]).not_to be_nil
    end

    it 'post and fail' do
      post :create, params: {user: { login: 'doni', password: 'whatever' }}
      expect(flash[:alert]).not_to be_nil
    end
  end

  describe 'token auth' do
    it 'auth via token' do
      user = create(:user, username: 'doni', password: 'whatever', password_confirmation: 'whatever')
      get :new, params: { token: user.auth_token }
      expect(controller.signed_in?).to eq true
    end

    it 'auth fail via token' do
      expect {get :new, params: { token: 'whatever'}}.to raise_error(ActionController::RoutingError)
      expect(controller.signed_in?).to eq false
    end
  end
end
