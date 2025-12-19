class ApplicationFormsController < ApplicationController
  def new
    @application = ApplicationForm.new
  end

  def create
    @application = ApplicationForm.new(application_params)

    if @application.save
      redirect_to root_path, notice: t("application.success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.require(:application_form).permit(
      :full_name, :email, :phone, :department, :message
    )
  end
end
