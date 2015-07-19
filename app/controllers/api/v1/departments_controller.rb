class API::V1::DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments.json
  def index
    @departments = Department.all
    render json: @departments
  end

  # POST /departments.json
  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/1.json
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1.json
  def destroy
    @department.destroy
    head :no_content
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      JSON.parse(request.body.read)["department"]
    end
end
