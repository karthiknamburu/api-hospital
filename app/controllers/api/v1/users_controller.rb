class API::V1::UsersController < ApplicationController
  before_action :set_department
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users.json
  def index
    @users = @department.users.all
    render json: @users
  end

  # POST /users.json
  def create
    @user = @department.users.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @user.destroy
    head :no_content
  end

  private
    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      JSON.parse(request.body.read)["user"]
    end
end
