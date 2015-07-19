require 'rails_helper'

describe API::V1::DepartmentsController do

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
      FactoryGirl.create_list(:department, 5)
      get :index, format: :json
      expect(response.body).to be_json_eql(response_file('/v1/department/index.json'))
    end
  end

  describe "POST create " do
    it "returns a successful 200 response" do
      post :create, { department: { name: "Department" } }.to_json
      expect(response).to be_success
    end

    it "should return proper json" do
      post :create, { department: { name: "Department" } }.to_json
      expect(response.body).to be_json_eql(response_file('/v1/department/create.json'))
    end
  end

  describe "PUT update" do
    before(:each) do
      @department = FactoryGirl.create(:department)
    end

    it "returns a successful 200 response" do
      put :update, { department: { name: "Department update" } }.to_json, id: @department.id
      expect(response).to be_success
    end

    it "should return proper json" do
      put :update, { department: { name: "Department update" } }.to_json, id: @department.id
      expect(response.body).to be_json_eql(response_file('/v1/department/update.json'))
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @department = FactoryGirl.create(:department)
    end

    it "returns a successful 200 response" do
      delete :destroy, id: @department.id
      expect(response).to be_success
    end

    it "should return proper json" do
      delete :destroy, id: @department.id
      expect(response.body).to eq("")
    end
  end

 end
