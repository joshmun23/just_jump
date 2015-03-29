class SearchesController < ApplicationController
  # before_action :new, only: [:index]

  def index
    search_term = params["menu_item"]
    # @search_results = get_yelp_data(search_term)
    binding.pry
  end

  def new
    @item_location = [MenuItem.new, Restaurant.new]
  end
end
