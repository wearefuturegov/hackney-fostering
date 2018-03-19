class Pet < ApplicationRecord
  belongs_to :application
  
  enum size: %i[small medium large]
end
