require 'spec_helper'

RSpec.describe 'Payu controller', type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:request) { get "/api/v1/users/#{user.id}" }

    before { request }

    it { expect(response_body).to have_http_status(:ok) }
  end
end
