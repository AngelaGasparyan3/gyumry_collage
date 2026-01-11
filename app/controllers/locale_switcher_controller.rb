class LocaleSwitcherController < ApplicationController
  skip_before_action :set_locale, only: [:update]

  # POST /set_locale
  def update
    requested = params[:locale].to_s
    allowed = begin
      Locale.enabled_codes
    rescue StandardError
      I18n.available_locales.map(&:to_s)
    end

    if allowed.include?(requested)
      session[:locale] = requested
      I18n.locale = requested
    end

    redirect_back(fallback_location: root_path)
  end
end
