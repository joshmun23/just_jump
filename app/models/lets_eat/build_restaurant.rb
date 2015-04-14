class BuildRestaurant
  def initialize(data, search_location)
    @data = data
    @search_location = search_location
    @restaurant = Restaurant.new
    @street_name = StreetName.new
    @postal_code = PostalCode.new
    @city = City.new
    @state_code = StateCode.new
    @country_code = CountryCode.new
  end

  def save_restaurants
    results = []
    @data.each do |restaurant|
      current_restaurant = Restaurant.where(name: restaurant['name'],
                            locality: set_locality(restaurant))

      if current_restaurant.empty?
        @restaurant.name = restaurant['name']

        @restaurant.locality = set_locality(restaurant)

        set_restaurant_data(restaurant)

        binding.pry if @restaurant.street_name_id.nil?
        results << (@restaurant.save ? @restaurant : nil)
      else
        results << current_restaurant.first
        next
      end

      @restaurant = Restaurant.new
    end
    results
  end

  def set_locality(restaurant)
    if restaurant['location']['locality']
      restaurant['location']['locality'].split(' ').join(' ')
    else
      @search_location
    end
  end

  def set_restaurant_data(restaurant)
    save_restaurant_data(restaurant)

    save_restaurant_location(restaurant)

    @restaurant.street_name_id = @street_name.id
    @restaurant.postal_code_id = @postal_code.id
  end

  def save_restaurant_data(restaurant)
    @restaurant.phone = restaurant['phone']
    @restaurant.is_closed = restaurant['is_closed']
    @restaurant.url = restaurant['url']
  end

  def save_restaurant_location(restaurant)
    country_code = restaurant['location']['country']
    save_country_code(country_code)

    state_code = restaurant['location']['region']
    save_state_code(state_code)

    city = @restaurant.locality.split.join(' ')
    save_city(city)

    postal_code = restaurant['location']['postal_code']
    save_postal_code(postal_code)

    street_name = location_and_address_finder(restaurant)
    save_street_name(street_name)
  end

  def save_country_code(country_code)
    if !find_or_create_code('country_code', country_code)
      @country_code.country_code = country_code
      @country_code.save
    else
      find_country_code = find_or_create_code('country_code', country_code)
      @country_code = find_country_code
    end
  end

  def save_state_code(state_code)
    if !find_or_create_code('state_code', state_code)
      @state_code.state_code = state_code
      @state_code.country_code_id = @country_code.id
      @state_code.save
    else
      find_state = find_or_create_code('state_code', state_code)
      @state_code = find_state
    end
  end

  def save_city(city)
    if !find_or_create_code('city', city)
      @city.city = city
      @city.state_code_id = @state_code.id
      @city.save
    else
      find_city = find_or_create_code('city', city)
      @city = find_city
    end
  end

  def save_postal_code(postal_code)
    if !find_or_create_code('postal_code', postal_code)
      @postal_code.postal_code = postal_code
      @postal_code.city_id = @city.id
      @postal_code.save
    else
      find_postal = find_or_create_code('postal_code', postal_code)
      @postal_code = find_postal
    end
  end

  def save_street_name(street_name)
    if !find_or_create_code('street_name', street_name)
      @street_name.street_name = street_name
      @street_name.postal_code_id = @postal_code.id
      @street_name.save
    else
      find_street = find_or_create_code('street_name', street_name)
      @street_name = find_street
    end
  end

  def find_or_create_code(code_type, code)
    result = case code_type
              when 'country_code'
                CountryCode.where(country_code: code).first
              when 'state_code'
                StateCode.where(state_code: code).first
              when 'city'
                City.where(city: code).first
              when 'postal_code'
                PostalCode.where(postal_code: code).first
              when 'street_name'
                StreetName.where(street_name: code).first
              end

    result = result.is_a?(Array) ? nil : result
  end

  def location_and_address_finder(restaurant)
    if restaurant['location']['address1']
      @restaurant.street_number = restaurant['location']['address1'].split(' ')[0]
      street_name = restaurant['location']['address1'].split(' ')[1..-1].join(' ')
    else
      if restaurant['location']['geo']['coordinates']
        @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
        @restaurant.latitude = restaurant['location']['geo']['coordinates'][1]

        full_street_name = Geocoder.address([@restaurant.latitude, @restaurant.longitude])
        street_name = full_street_name.split(', ')[0].split[1..-1].join(' ')
        @restaurant.street_number = street_name.split[0]
      end
    end

      street_city = "#{street_name}, #{@city.city}, #{@postal_code.postal_code}, "
      postal_state = "#{@postal_code.postal_code}, #{@state_code.state_code}"

      backup_street_name = street_city + postal_state

      full_street_name = full_street_name ? full_street_name : backup_street_name

    if restaurant['location']['geo']
      @restaurant.latitude = restaurant['location']['geo']['coordinates'][1]
      @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
    else
      coordinates = Geocoder.coordinates(full_street_name)
      @restaurant.latitude = coordinates[0]
      @restaurant.longitude = coordinates[1]
    end

    street_name
  end
end
