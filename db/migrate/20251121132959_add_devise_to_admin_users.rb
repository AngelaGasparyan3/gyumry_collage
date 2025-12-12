# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :admin_users do |t|
      ## Only add fields that do NOT already exist

      # encrypted_password
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:admin_users, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:admin_users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:admin_users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:admin_users, :remember_created_at)
    end

    # Indexes
    add_index :admin_users, :email, unique: true unless index_exists?(:admin_users, :email)
    add_index :admin_users, :reset_password_token, unique: true unless index_exists?(:admin_users, :reset_password_token)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
