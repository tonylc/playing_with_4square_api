class BusinessResult
  def initialize(json)
    @json = json
  end
  
  def businesses
    @businesses ||= @json["businesses"].collect { |b| Business.new(b) }
  end
end