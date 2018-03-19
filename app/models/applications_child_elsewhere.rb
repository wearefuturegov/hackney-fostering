class ApplicationsChildElsewhere < ApplicationRecord
  self.table_name = :applications_children_elsewhere
  
  belongs_to :application
  belongs_to :person
end
