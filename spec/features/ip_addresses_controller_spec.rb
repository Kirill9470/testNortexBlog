require 'rails_helper'

RSpec.describe IpAddressesController, type: :controller do
  render_views

  describe "GET#index ip_addresses with params" do
    before do
      get :index, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      json_parse.count.should be > 1
      json_parse.first['logins_array'].count.should be > 1
    end
  end
end