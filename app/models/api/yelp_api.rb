class YelpAPI
  def initialize(search_term, search_location, options = nil)
    @search_term = search_term
    @search_location = search_location
    @options = options
  end

  def yelp_client
    client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                            consumer_secret: ENV['CONSUMER_SECRET'],
                            token: ENV['TOKEN'],
                            token_secret: ENV['TOKEN_SECRET']
                          })
  end

  def get_yelp_data(search_term, search_location, options)
    #data = yelp_client.search("San Francisco")
    #Sort mode: 0=Best matched (default), 1=Distance, 2=Highest Rated.
    #Sort by distance is only supported for a location or geographic search.
    #Search radius in meters. If the value is too large, a AREA_TOO_LARGE error may be returned. The max value is 40000 meters (25 miles).
    #Deals: Whether to exclusively search for businesses with deals
    data = yelp_client.search(search_location, { search_term: search_term, sort: 2, deals_filter: true }).to_json
    # limit: 5, sort: 2, radius_filter: 25, deals_filter: false
    data = JSON.parse(data).to_a
  end

  def fetch_and_store_restaurant_data
    binding.pry
    r_data = fetch_restaurant_data
    binding.pry
    r_data = store_restaurant_data(r_data)

    r_data
  end

  def fetch_restaurant_data
    binding.pry
    @search_term = @search_term.gsub(/&/, '')

    request = "#{@search_term.split(' ').join('-')}-#{@search_location.split(' ').join('-')}"
    r_data = yelp_client.business(request)
    r_data = JSON.parse(r_data.to_json)
  end

  def store_restaurant_data(r_data)
    binding.pry
    r_data['street_number'] = r_data['location']['address'][0].split(' ')[0]
    r_data['longitude'] = r_data['location']['coordinate']['longitude'].to_f
    r_data['latitude'] = r_data['location']['coordinate']['latitude'].to_f

    r_data
  end
end
