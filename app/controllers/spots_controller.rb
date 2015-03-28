class SpotsController < ApplicationController
  # before_action :set_menu_item, only: [:index]
  # before_action :show, only: [:index]
  before_action :new, only: [:index]

  def index
    if params[:menu_item] && params[:location]
      @search = { term: params[:menu_item],
                location: params[:location] }
      @menu_items = FetchSpots.new(@search[:term], @search[:location]).fetch_all_data
      binding.pry
      redirect_to spots_path
    end

    # if in DB
    #check is menu items exist in database already within location
    # @menu_items = Menu_item.where(name: @search[:menu_item])
    # @restaurants = Restaurant.where(id: @menu_items.id)

    #else
  end

  def new
    @restaurant_item = {}

    @menu_item = MenuItem.new
    @restaurant = Restaurant.new
    @postal_code = PostalCode.new
    @neighborhood = Neighborhood.new
    @city = City.new
    @state_code = StateCode.new
    @street_name = StreetName.new
    @country_code = CountryCode.new

    #curl commands? within ruby code
    # cmd = "as;dfkjsadl;kfa"
    # `#{}cmd`
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
