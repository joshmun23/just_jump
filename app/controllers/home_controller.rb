class HomeController < ApplicationController
  # before_action :set_menu_item, only: [:index]
  before_action :show, only: [:index]

  def index
    #Still need to search dynamically
    if params.count > 2
      if !params['menu_item'].empty?
        search_term = params['menu_item']
        @search_results = get_yelp_data(search_term)
      end
    end
    # @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def show
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end

  def set_restaurant_item
    @restaurant_item = Restaurant.find(params[:id])
  end

  def restaurant_item_params
    params.require(:restaurant).permit(:name, :phone, :is_closed,
       :url, :mobile_url, :snippet_text, :street_number, :latitude, :longitude)
  end
end
