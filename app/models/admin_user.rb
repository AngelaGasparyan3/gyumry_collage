class AdminUser < ApplicationRecord
  # Devise modules (ActiveAdmin usually expects :database_authenticatable and :recoverable etc.)
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Ransack (v4+) requires explicitly allowlisting model attributes that should be searchable.
  # Keep sensitive columns (encrypted_password, reset_password_token, etc.) out of this list.
  #
  # If you add or rename columns used for search in ActiveAdmin, update this list accordingly.
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      created_at
      updated_at
      remember_created_at
      reset_password_sent_at
    ].freeze
  end

  # If your AdminUser has associations you want searchable in Ransack, list them here.
  # For example: %w[roles organization].freeze
  def self.ransackable_associations(auth_object = nil)
    [].freeze
  end
end
