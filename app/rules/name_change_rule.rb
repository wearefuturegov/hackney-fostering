class NameChangeRule < ApplicationRule
  
  def process
    @next_step = params[:application][:name_change] == 'true' ? :what_is_your_name_change : :gender
  end
  
end
