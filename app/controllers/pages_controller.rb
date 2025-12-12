class PagesController < ApplicationController
  def home
    @departments = Department.includes(:programs).all
  end

  def about; end
  def student_life; end
  def admissions; end
end
