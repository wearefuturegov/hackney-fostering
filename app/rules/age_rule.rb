class AgeRule < ApplicationRule
  def process
    @next_step = if params[:application][:over_21] == 'true'
                   application.update_attribute(:eligible, true)
                   :experience
                 else
                   application.update_attribute(:eligible, false)
                   :other_ways
                 end
  end
end
