class SpareRoomRule < Incredible::Rule
  
  def process
    @next_step = if params[:application][:spare_room] == 'yes'
                   application.update_attribute(:eligible, true)
                   :over_21
                 else
                   application.update_attribute(:eligible, false)
                   :other_ways
                 end
  end
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
  
end
