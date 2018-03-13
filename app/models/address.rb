class Address < ApplicationRecord
  belongs_to :application, optional: true
  
  enum address_type: %i[primary previous]
  
  def full_address
    [line_1, line_2, line_3, post_town, postcode].reject(&:blank?).join(', ')
  end
end
