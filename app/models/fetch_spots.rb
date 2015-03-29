class FetchSpots
  def initialize(search_term, search_location)
    @search_term = search_term
    @search_location = search_location
  end

  def fetch_all_data
    data = fetch_restaurant_data

    restaurant_data = parse_restaurant_data(data)
    menu_item_data = parse_menu_item_data(data, restaurant_data)
  end

  def fetch_restaurant_data
    data = LocuAPI.new(@search_term, @search_location).locu_search
  end

  # def fetch_restaurants
  #   YelpAPI.new(@search_term, @search_location)
  # end

  def parse_restaurant_data(data)
    restaurants = BuildRestaurant.new(data, @search_location).save_restaurants
  end

  def parse_menu_item_data(data, restaurant_data)
    menu_items = BuildMenuItem.new(data, restaurant_data).parse_menu_items
  end
end
