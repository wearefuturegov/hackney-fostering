class ApplicationsAdultElsewhere < ApplicationRecord
  self.table_name = :applications_adults_elsewhere
  
  belongs_to :application
  belongs_to :person
end
