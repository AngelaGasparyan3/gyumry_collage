class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :load_site_settings

  def load_site_settings
    @site = SiteSetting.first
  end

    def set_locale
      # Allowed locales from DB; if DB not ready, fall back to I18n.available_locales
      allowed = begin
        Locale.enabled_codes
      rescue => e
        I18n.available_locales.map(&:to_s)
      end

      # Determine default code from DB or fallback to 'hy'
      default_code = begin
        Locale.default&.code || 'hy'
      rescue => e
        'hy'
      end

      requested = params[:locale].presence || extract_locale_from_accept_language_header || default_code
      requested = requested.to_s

      if allowed.include?(requested)
        I18n.locale = requested
      else
        I18n.locale = default_code
      end
    end

    # Ensure helpers generate locale-aware paths
    def default_url_options
      { locale: I18n.locale }
    end

    def extract_locale_from_accept_language_header
      return nil unless request && request.env['HTTP_ACCEPT_LANGUAGE']
      locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      locale if (begin Locale.enabled_codes.include?(locale) rescue I18n.available_locales.map(&:to_s).include?(locale) end)
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
