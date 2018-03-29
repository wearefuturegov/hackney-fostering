class Applicant < Person
  has_one :application
  
  validates :first_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name]) }
  validates :last_name, presence: true, if: -> { application&.on_step?(%w[what_is_your_name]) }

end
