class SearchService
  
  def nearby_listings
    get("http://www.yelp.com", "yelp") { |r| BusinessResult.new(r) }
  end
  
  private
  
  def get(url, query, *args)
    options = args.extract_options!
    
    params = {:q => query}
    args.each_with_index {|a,i|
      params[('p' + i.to_s).to_sym] = a.respond_to?('join') ? a.join(',') : a.to_s
    }
    filename = Dir.glob("#{RAILS_ROOT}/app/views/fake/#{params[:q].underscore}.json{,.erb}").first
    raise "Missing app/views/fake/#{params[:q].underscore}.json" if filename.nil?
    response = ERB.new(File.read(filename)).result
    response = case response
      when /^\s*[\[{].*/ then JSON.parse(response)
      when 'true' then true
      when 'false' then false
      when 'null' then nil
      else response
    end
    
    response && block_given? ? yield(response) : response
  end
end