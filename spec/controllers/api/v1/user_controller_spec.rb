require 'rails_helper'

describe API::V1::UsersController do
  let(:department) { FactoryGirl.create(:department) }

 include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET 'index' " do
    it "returns a successful 200 response" do
      get :index, department_id: department.id
      expect(response).to be_success
    end

    it "should return proper json" do
      FactoryGirl.create_list(:user, 5, department_id: department.id)
      get :index, department_id: department.id
      expect(response.body).to be_json_eql(response_file('/v1/user/index.json'))
    end
  end

  describe "POST create " do
    it "returns a successful 200 response" do
      post :create, { user: { name: "David" } }.to_json, department_id: department.id
      expect(response).to be_success
    end

    it "should return proper json" do
      post :create, { user: { name: "David" } }.to_json, department_id: department.id
      expect(response.body).to be_json_eql(response_file('/v1/user/create.json'))
    end
  end

  describe "PUT update" do
    before(:each) do
      @user = FactoryGirl.create(:user, department_id: department.id)
    end

    it "returns a successful 200 response" do
      put :update, { user: { name: "David Warner" } }.to_json, department_id: department.id, id: @user.id
      expect(response).to be_success
    end

    it "should return proper json" do
      put :update, { user: { name: "David Warner" } }.to_json, department_id: department.id, id: @user.id
      expect(response.body).to be_json_eql(response_file('/v1/user/update.json'))
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @user = FactoryGirl.create(:user, department_id: department.id)
    end

    it "returns a successful 200 response" do
      delete :destroy, id: @user.id, department_id: department.id
      expect(response).to be_success
    end

    it "should return proper json" do
      delete :destroy, id: @user.id, department_id: department.id
      expect(response.body).to eq("")
    end
  end

 end
