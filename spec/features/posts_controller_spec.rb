require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  describe "GET#index posts with params" do
    before do
      get :index, params: {evaluation: 5, limit: 1}, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      json_parse.count.should be == 1
    end
  end

  describe "POST#create create user" do
    before do
      post :create, params: {post: {title: 'Test post', description: 'Here should be text..', authors_login: 'Andry', ip_address: '192.168.1.1'}}, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      expect(json_parse['title']).to eq('Test post')
    end
  end

  describe "POST#create check validate" do
    before do
      post :create, params: {post: {title: '', description: '', authors_login: 'Andry', ip_address: '192.168.1.1'}}, format: :json
    end

    it "returns http unprocessable_entity" do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      expect(json_parse[0]).to eq("Title can't be blank")
      expect(json_parse[1]).to eq("Description can't be blank")
    end
  end
end