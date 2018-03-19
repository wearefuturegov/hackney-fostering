class ApplicationsChild < ApplicationRecord
  belongs_to :application
  belongs_to :person
end
