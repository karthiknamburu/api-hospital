require 'rails_helper'

describe API::V1::MessagesController do
  let(:department) { FactoryGirl.create(:department) }
  let(:user_one) { FactoryGirl.create(:user, department_id: department.id) }
  let(:user_two) { FactoryGirl.create(:user, department_id: department.id) }
  let(:chat) { FactoryGirl.create(:chat, user_one_id: user_one.id, user_two_id: user_two.id) }

 include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET 'index' " do
    it "returns a successful 200 response" do
      get :index, chat_id: chat.id
      expect(response).to be_success
    end

    it "should return proper json" do
      FactoryGirl.create_list(:message, 5, sender_id: user_one.id, chat_id: chat.id)
      get :index, chat_id: chat.id
      expect(response.body).to be_json_eql(response_file('/v1/message/index.json'))
    end
  end

  describe "POST create " do
    it "returns a successful 200 response" do
      post :create, { message: { body: "hello" } }.to_json, chat_id: chat.id
      expect(response).to be_success
    end

    it "should return proper json" do
      post :create, { message: { body: "Hello" } }.to_json, chat_id: chat.id
      expect(response.body).to be_json_eql(response_file('/v1/message/create.json'))
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @message = FactoryGirl.create(:message, sender_id: user_one.id, chat_id: chat.id)
    end

    it "returns a successful 200 response" do
      delete :destroy, id: @message.id, chat_id: chat.id
      expect(response).to be_success
    end

    it "should return proper json" do
      delete :destroy, id: @message.id, chat_id: chat.id
      expect(response.body).to eq("")
    end
  end

 end
