require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  it 'get new' do
    get :new
    expect(response).to have_http_status(200)
  end

  it 'post create' do
    create(:user, username: 'doni', password: 'whatever', password_confirmation: 'whatever')
    post :create, params: {user: { login: 'doni', password: 'whatever' }}
    expect(response).to have_http_status(302)
    expect(flash[:notice]).not_to be_nil
  end

  it 'post and fail' do
    post :create, params: {user: { login: 'doni', password: 'whatever' }}
    expect(flash[:alert]).not_to be_nil
  end
end
