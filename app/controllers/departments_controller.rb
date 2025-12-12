class DepartmentsController < ApplicationController
  def index
    @departments = Department.includes(:programs).order(:name)
  end

  def show
    @department = Department.includes(:programs).find(params[:id])
  end
end
