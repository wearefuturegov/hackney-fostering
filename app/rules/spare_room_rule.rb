class SpareRoomRule
  
  def self.process(params)
    params[:spare_room] == 'yes' ? :what_is_your_name : :other_ways
  end
  
end