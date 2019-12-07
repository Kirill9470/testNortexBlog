require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  describe "GET#index users" do
    before do
      get :index, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      json_parse.count.should be > 0
    end
  end

  describe "POST#create create user" do
    before do
      post :create, params: {user: {login: 'TestUser'}}, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      expect(json_parse['login']).to eq('TestUser')
    end
  end

  describe "POST#create check validate" do
    before do
      post :create, params: {user: {login: ''}}, format: :json
    end

    it "returns http unprocessable_entity" do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      expect(json_parse.first).to eq("Login can't be blank")
    end
  end
end