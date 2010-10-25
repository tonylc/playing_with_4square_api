class SearchController < ApplicationController
  def view
    if request.post?
      @business_result = search_service.nearby_listings
    end
  end
end
