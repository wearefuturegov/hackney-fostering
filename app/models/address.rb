class Address < ApplicationRecord
  has_one :application
  
  enum address_type: %i[primary previous]
  
  validates :line_1, presence: true, if: -> { application&.on_step?(%w[full_address reference_address]) }
  validates :post_town, presence: true, if: -> { application&.on_step?(%w[full_address reference_address]) }
  validates :postcode, presence: true
  validates :date_from, presence: true, if: -> { application&.on_step?(%w[full_address]) }
  
  def full_address
    [line_1, line_2, line_3, post_town, postcode].reject(&:blank?).join(', ')
  end
  
  def years_ago
    Time.now.utc.to_date.year - date_from.year
  end
end
