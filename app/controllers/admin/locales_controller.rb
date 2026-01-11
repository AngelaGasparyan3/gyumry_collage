module Admin
  class LocalesController < ApplicationController
    before_action :set_locale_record, only: [:edit, :update, :destroy, :set_default, :toggle_enabled]

    # TODO: Protect admin routes — replace with your auth method
    before_action :require_admin!

    def index
      @locales = Locale.order(:position)
    end

    def new
      @locale = Locale.new
    end

    def create
      @locale = Locale.new(locale_params)
      if @locale.save
        redirect_to admin_locales_path, notice: "Locale created."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @locale.update(locale_params)
        redirect_to admin_locales_path, notice: "Locale updated."
      else
        render :edit
      end
    end

    def destroy
      @locale.destroy
      redirect_to admin_locales_path, notice: "Locale removed."
    end

    # POST /admin/locales/:id/set_default
    def set_default
      @locale.set_as_default!
      redirect_to admin_locales_path, notice: "Default locale updated."
    end

    # POST /admin/locales/:id/toggle_enabled
    def toggle_enabled
      @locale.update(enabled: !@locale.enabled)
      redirect_to admin_locales_path, notice: "Locale #{ @locale.enabled ? 'enabled' : 'disabled' }."
    end

    private

    def set_locale_record
      @locale = Locale.find(params[:id])
    end

    def locale_params
      params.require(:locale).permit(:code, :name, :enabled, :position, :default_locale)
    end

    def require_admin!
      # Implement your admin authorization here.
      # Example using Devise + a boolean admin flag:
      # redirect_to root_path unless current_user&.admin?
      true
    end
  end
end
