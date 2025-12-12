class ProgramsController < ApplicationController
  def show
    @department = Department.find(params[:department_id])
    @program = @department.programs.find(params[:id])
  end
end
