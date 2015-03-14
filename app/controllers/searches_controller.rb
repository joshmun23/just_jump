class SearchesController < ApplicationController
  def index
    search_term = params["menu_item"]
    @search_results = get_yelp_data(search_term)

  end
end
