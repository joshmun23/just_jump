class BuildRestaurant
  def initialize(data, search_location)
    @data = data
    @search_location = search_location
    @restaurant = Restaurant.new
    @street_name = StreetName.new
    @neighborhood = Neighborhood.new
    @postal_code = PostalCode.new
    @city = City.new
    @state_code = StateCode.new
    @country_code = CountryCode.new
  end

  def save_restaurants
    results = []
    @data.each do |restaurant|
      current_restaurant = Restaurant.where(name: restaurant['name'], locality: set_location(restaurant))
      if current_restaurant.empty?
        @restaurant.name = restaurant['name']
        binding.pry

        @restaurant.locality = set_location(restaurant)
        binding.pry

        set_restaurant_data
        binding.pry

        results << (@restaurant.save ? @restaurant : nil)
        binding.pry
      else
        binding.pry
        results << current_restaurant.first
        next
      end

      @restaurant = Restaurant.new
    end
    results
  end

  def set_location(restaurant)
    if restaurant['location']['locality']
      restaurant['location']['locality'].split(' ').join('-')
    else
      @search_location
    end
  end

  def set_restaurant_data
    r_data = YelpAPI.new(@restaurant.name, @restaurant.locality)
    r_data = r_data.fetch_and_store_restaurant_data

    save_yelp_restaurant_data(r_data)

    save_yelp_restaurant_location(r_data)

    @restaurant.street_name_id = @street_name.id
    @restaurant.postal_code_id = @postal_code.id
  end

  def save_yelp_restaurant_data(r_data)
    @restaurant.phone = r_data['phone']# ? r_data['phone'] : nil
    @restaurant.is_closed = r_data['is_closed']# ? r_data['is_closed'] : nil
    @restaurant.url = r_data['url']# ? r_data['is_closed'] : nil
    @restaurant.longitude = r_data['longitude']# ? r_data['longitude'] : nil
    @restaurant.latitude = r_data['latitude']# ? r_data['latitude'] : nil
    @restaurant.street_number = r_data['street_number']# ? r_data['address'] : nil
  end

  def save_yelp_restaurant_location(r_data)
    neighborhood = r_data['location']['neighborhoods'].first
    save_neighborhood(neighborhood)

    country_code = r_data['location']['country_code']
    save_country_code(country_code)

    state_code = r_data['location']['state_code']
    save_state_code(state_code)

    city = r_data['location']['city']
    save_city(city)

    postal_code = r_data['location']['postal_code']
    save_postal_code(postal_code)

    street_name = r_data['location']['address'][0].split(' ')[1..-1].join(' ')
    save_street_name(street_name)
  end

  def save_neighborhood(neighborhood)
    @neighborhood.neighborhood = neighborhood
    @neighborhood.save
  end

  def save_country_code(country_code)
    @country_code.country_code = country_code
    @country_code.save
  end

  def save_state_code(state_code)
    @state_code.state_code = state_code
    @state_code.country_code_id = @country_code.id
    @state_code.save
  end

  def save_city(city)
    @city.city = city
    @city.state_code_id = @state_code.id
    @city.save
  end

  def save_postal_code(postal_code)
    @postal_code.postal_code = postal_code
    @postal_code.neighborhood_id = @neighborhood.id
    @postal_code.city_id = @city.id
    @postal_code.save
  end

  def save_street_name(street_name)
    @street_name.street_name = street_name
    @street_name.postal_code_id = @postal_code.id
    @street_name.save
  end
end
