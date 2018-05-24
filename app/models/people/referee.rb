class Referee < Person
  belongs_to :address, optional: true, autosave: true
  belongs_to :application
  after_initialize :add_address
  
  accepts_nested_attributes_for :address
  
  enum relationship: %i[friend neighbour ex_partner co_worker other]
  
  delegate :line_1, :line_2, :line_3, :post_town, :postcode, to: :address, allow_nil: true
  delegate :line_1=, :line_2=, :line_3=, :post_town=, :postcode=, to: :address

  validates :first_name, presence: true, if: -> { application&.on_step?(%w[referees]) }
  validates :last_name, presence: true, if: -> { application&.on_step?(%w[referees]) }
  validates :email, presence: true, if: -> { application&.on_step?(%w[referees]) }
  validates :phone_number, presence: true, if: -> { application&.on_step?(%w[referees]) }
  validates :relationship, presence: true, if: -> { application&.on_step?(%w[referees]) }
  validates :years_known, presence: true, if: -> { application&.on_step?(%w[referees]) }
  
  private
  
  def add_address
    self.address ||= Address.new if new_record?
  end
end
