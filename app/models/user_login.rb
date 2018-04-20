class UserLogin < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :user, polymorphic: true
    
  def send_confirmation_notification?
    false
  end
  
  def password_required?
    !new_record? # Don't require password when creating
  end
  
  def password_match? # rubocop:disable Metrics/AbcSize
    errors[:password] << I18n.t('errors.messages.blank') if password.blank?
    errors[:password_confirmation] << blank_error_message if password_confirmation.blank?
    errors[:password_confirmation] << confirmation_error_message if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
  
  def blank_error_message
    I18n.t('errors.messages.blank')
  end
  
  def confirmation_error_message
    I18n.t('errors.messages.confirmation', attribute: 'password')
  end

  # new function to set the password without knowing the current
  # password used in our confirmation controller.
  def attempt_set_password(params)
    if no_password?
      p = {}
      p[:password] = params[:password]
      p[:password_confirmation] = params[:password_confirmation]
      update_attributes(p)
    else
      errors.add(:email, :password_already_set)
    end
  end

  # new function to return whether a password has been set
  def no_password?
    encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore.
  # Instead you should use `pending_any_confirmation`.
  def only_if_unconfirmed
    pending_any_confirmation { yield }
  end
end
