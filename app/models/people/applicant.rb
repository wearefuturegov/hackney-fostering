class Applicant < Person
  has_one :application
  has_one :login, class_name: 'UserLogin', as: :user, autosave: true
  
  validates :first_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name]) }
  validates :last_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name]) }
  validates :email, presence: true, if: -> { application&.on_step?(%w[contact_email]) }
  validates :email, uniqueness: true, if: -> { application&.on_step?(%w[contact_email]) }
  validates :previous_first_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name_change]) }
  validates :previous_last_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name_change]) }
  validates :date_changed, presence: true, if: -> { application&.on_step?(%w[previous_name_period]) }
  validates :gender, presence: true, if: -> { application&.on_step?(%w[gender]) }
  validates :date_of_birth, presence: true, if: -> { application&.on_step?(%w[dob]) }
  validates :country_of_birth, presence: true, if: -> { application&.on_step?(%w[country_of_birth]) }
  validates :town_of_birth, presence: true, if: -> { application&.on_step?(%w[town_of_birth]) }
  validates :nationality, presence: true, if: -> { application&.on_step?(%w[nationality]) }
  
  def create_user_login!
    UserLogin.create(email: email, password: default_password, user: self)
  end
  
  def default_password
    Devise.friendly_token.first(20)
  end
end
