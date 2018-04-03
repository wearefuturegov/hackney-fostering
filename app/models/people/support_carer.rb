class SupportCarer < Person
  has_one :application

  validates :first_name, presence: true, if: -> { application&.on_step?(%w[name]) }
  validates :last_name, presence: true, if: -> { application&.on_step?(%w[name]) }
  validates :email, presence: true, if: -> { application&.on_step?(%w[contact]) }
  validates :phone_number, presence: true, if: -> { application&.on_step?(%w[contact]) }
end
