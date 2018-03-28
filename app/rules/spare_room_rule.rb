class SpareRoomRule < ApplicationRule
  def process
    @next_step = if params[:application][:spare_room] == 'yes'
                   application.update_attribute(:eligible, true)
                   :over_21
                 else
                   application.update_attribute(:eligible, false)
                   :other_ways
                 end
  end
end
