module HouseholdMember
  extend ActiveSupport::Concern
  
  included do
    has_one :application

    validates :first_name, presence: true, if: -> { application&.on_step?(%w[name]) }
    validates :last_name, presence: true, if: -> { application&.on_step?(%w[name]) }
    validates :gender, presence: true, if: -> { application&.on_step?(%w[gender]) }
    validates :date_of_birth, presence: true, if: -> { application&.on_step?(%w[dob]) }
    validates :relationship, presence: true, if: -> { application&.on_step?(%w[relationship]) }
  end
  
end
