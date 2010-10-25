class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def search_service
    SearchService.new
  end
end
