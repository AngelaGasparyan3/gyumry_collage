class PagesController < ApplicationController
  def home
    @site = SiteSetting.first
    @departments = Department.all
    @programs = Program.all
  end

  def about
  end

  def admissions
  end
end
