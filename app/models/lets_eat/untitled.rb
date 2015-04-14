    if restaurant['location']['address1']
      @restaurant.street_number = restaurant['location']['address1'].split(' ').first
      street_name = restaurant['location']['address1'].split(' ')[1..-1].join(' ')
      @street_number = restaurant['location']['address1'].split(' ')[0]

      binding.pry
    else
      @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
      @restaurant.latitude = restaurant['location']['geo']['coordinates'][1]
    end

    save_street_name(street_name)

    binding.pry if restaurant['location']['geo']['coordinates'].nil?
    if restaurant['location']['geo']['coordinates']
      @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
      @restaurant.latitude = restaurant['location']['geo']['coordinates'][1]
    else
      full_street = "#{@restaurant.street_number} #{@street_name.street_name}"
      @restaurant.latitude = Geocoder.coordinates(full_street)
      @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
    end
  end


def location_and_address_finder

end


if restaurant['location']['address1']
      @restaurant.street_number = restaurant['location']['address1'].split(' ').first
      street_name = restaurant['location']['address1'].split(' ')[1..-1].join(' ')
    else
      if restaurant['location']['geo']['coordinates']
        @restaurant.longitude = restaurant['location']['geo']['coordinates'][0]
        @restaurant.latitude = restaurant['location']['geo']['coordinates'][1]

        coordinates = [@restaurant.latitude, @restaurant.longitude]

        @restaurant.street_number = Geocoder.address(coordinates)
      end
    end
