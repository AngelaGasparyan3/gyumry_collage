class ContactMessagesController < ApplicationController
  protect_from_forgery except: :create

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if @contact_message.save
      # Optionally: send email to admin here
      render json: { success: true }
    else
      render json: { success: false, errors: @contact_message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :message)
  end
end
