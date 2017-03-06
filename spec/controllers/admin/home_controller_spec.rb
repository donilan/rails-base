require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do
  describe 'get index' do
    it 'response ok' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
