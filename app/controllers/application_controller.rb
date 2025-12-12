class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # If ActiveAdmin is configured to call `authenticate_admin_user!`,
  # implement it here to reuse Devise's authenticate_user! and then
  # verify an `admin` flag on the User model.
  def authenticate_admin_user!
    # require a signed-in user first
    authenticate_user!

    # redirect non-admins to home with a message
    unless current_user && current_user.respond_to?(:admin) && current_user.admin?
      flash[:alert] = "Դուք չունեք մուտքի իրավունք այս բաժնի համար"
      redirect_to root_path
    end
  end

  # ActiveAdmin expects a method to return the current admin user.
  # Use the existing current_user (Devise) if it's an admin, otherwise nil.
  def current_admin_user
    current_user if current_user && current_user.respond_to?(:admin) && current_user.admin?
  end
end
