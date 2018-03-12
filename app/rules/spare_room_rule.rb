class SpareRoomRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:spare_room] == 'yes' ? :over_21 : :other_ways
  end
  
end
