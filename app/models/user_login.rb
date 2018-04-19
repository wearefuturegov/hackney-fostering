class UserLogin < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :user, polymorphic: true
  
  delegate :email, to: :user
end
