class Business
  def initialize(json)
    @json = json
  end
  
  def latitude
    @json["latitude"]
  end
  
  def longitude
    @json["longitude"]
  end
  
  def name
    @json["name"]
  end
end