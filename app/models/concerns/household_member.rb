module HouseholdMember
  extend ActiveSupport::Concern
  
  included do
    belongs_to :application

    validates :first_name, presence: true, if: -> { on_edit_step? }
    validates :last_name, presence: true, if: -> { on_edit_step? }
    validates :gender, presence: true, if: -> { on_edit_step? }
    validates :date_of_birth, presence: true, if: -> { on_edit_step? }
    validates :relationship, presence: true, if: -> { on_edit_step? }
  end
  
  def on_edit_step?
    application&.on_step?(
      %w[
        children_living_at_home 
        children_living_elsewhere
        adults_living_at_home
        adults_living_elsewhere
      ]
    )
  end
end
