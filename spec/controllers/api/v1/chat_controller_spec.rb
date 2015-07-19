require 'rails_helper'

describe API::V1::ChatsController do
  let(:department) { FactoryGirl.create(:department) }
  let(:user_one) { FactoryGirl.create(:user, department_id: department.id) }
  let(:user_two) { FactoryGirl.create(:user, department_id: department.id) }

 include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET 'index' " do
    it "returns a successful 200 response" do
      get :index, format: :json
      expect(response).to be_success
    end

    it "should return proper json" do
      FactoryGirl.create(:chat, user_one_id: user_one.id, user_two_id: user_two.id)
      get :index, format: :json
      expect(response.body).to be_json_eql(response_file('/v1/chat/index.json'))
    end
  end

  describe "POST create " do
    it "returns a successful 200 response" do
      post :create, { chat: { user_one_id: user_one.id, user_two_id: user_two.id } }.to_json
      expect(response).to be_success
    end

    it "should return proper json" do
      post :create, { chat: { user_one_id: user_one.id, user_two_id: user_two.id } }.to_json
      expect(response.body).to be_json_eql(response_file('/v1/chat/create.json'))
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @chat = FactoryGirl.create(:chat, user_one_id: user_one.id, user_two_id: user_two.id)
    end

    it "returns a successful 200 response" do
      delete :destroy, id: @chat.id
      expect(response).to be_success
    end

    it "should return proper json" do
      delete :destroy, id: @chat.id
      expect(response.body).to eq("")
    end
  end

 end
