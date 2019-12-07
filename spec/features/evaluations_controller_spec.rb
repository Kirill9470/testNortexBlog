require 'rails_helper'

RSpec.describe EvaluationsController, type: :controller do
  render_views
  describe "POST#create create evaluation" do
    before do
      post_record = Post.first
      post :create, params: {evaluation: {value: 5, post_id: post_record.id}}, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "get JSON body response" do
      post_record = Post.first
      json_parse = JSON.parse(response.body)
      expect(json_parse['score']).to eq(post_record.score)
    end
  end

  describe "POST#create check validate" do
    before do
      post_record = Post.first
      post :create, params: {evaluation: {login: '', post_id: post_record.id}}, format: :json
    end

    it "returns http unprocessable_entity" do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "get JSON body response" do
      json_parse = JSON.parse(response.body)
      expect(json_parse.first).to eq("Value can't be blank")
    end
  end
end