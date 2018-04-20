# frozen_string_literal: true

class DeviseCreateUserLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logins do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.timestamps null: false
      
      t.belongs_to :user, polymorphic: true
    end

    add_index :user_logins, :email,                unique: true
    add_index :user_logins, :reset_password_token, unique: true
    add_index :user_logins, :confirmation_token,   unique: true
  end
end
