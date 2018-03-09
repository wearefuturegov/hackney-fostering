class SpareRoomRule
  
  def self.process(params)
    params[:application][:spare_room] == 'yes' ? :over_21 : :other_ways
  end
  
end
