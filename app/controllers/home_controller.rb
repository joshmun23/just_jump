class HomeController < ApplicationController
  def index
    #Still need to search dynamically
    @data = get_yelp_data
  end
end
