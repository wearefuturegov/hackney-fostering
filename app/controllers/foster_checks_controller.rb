class FosterChecksController < ApplicationController
  expose :foster_check
  
  def create
    redirect_to new_foster_check_form_path(foster_check_id: foster_check.id) if foster_check.save
  end
  
end
