class Address < ApplicationRecord
  belongs_to :application, optional: true
  
  enum address_type: %i[primary previous]
end
