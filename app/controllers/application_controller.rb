class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :load_site_settings

  def load_site_settings
    @site = SiteSetting.first
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
  
  def create
  @application = ApplicationForm.new(application_params)

  if @application.save
    ApplicationMailer.new_application(@application).deliver_later
    redirect_to root_path, notice: t("application.success")
  else
    render :new, status: :unprocessable_entity
  end
end

end
