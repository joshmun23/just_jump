class FetchSpots
  def initialize(search_term, search_location)
    @search_term = search_term
    @search_location = search_location
    @menu_items = {}
    @restaurants = {}

  end

  def fetch_all_data
    data = fetch_menu_items

    restaurant_data = parse_restaurant_data(data)
    binding.pry
    # r_data = fetch_restaurants

    # parse_restaurant_data = BuildRestaurant.new(data)
    restaurant_data
  end

  def fetch_menu_items
    data = LocuAPI.new(@search_term, @search_location).locu_search
  end

  def fetch_restaurants
    YelpAPI.new(@search_term, @search_location)
  end

  def parse_restaurant_data(data)
    restaurants = BuildRestaurant.new(data, @search_location).save_restaurants
    binding.pry
    restaurants
  end

  def menu_items
    []
  end
end
