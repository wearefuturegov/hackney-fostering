class ApplicationsReferee < ApplicationRecord
  belongs_to :application
  belongs_to :person
end
