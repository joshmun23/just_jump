class LocuAPI
  def initialize(search_term, search_location)
    @data = nil
    @search_term = search_term
    @search_location = search_location
    @latitude = @search_location[0]
    @longitude = @search_location[1]
  end

  def locu_search
    #https://dev.locu.com/documentation/
    api_key = ENV['LOCU_KEY']
    # "fields": [ "name", "menus", "delivery" ],

    binding.pry
    request =
      %{{
    "api_key": "#{api_key}",
    "venue_queries": [
      {
        "location": {
          "geo": "$in_lat_lng_radius" : [#{@latitude}, #{@longitude}, 5000]"
        }
      }
    ],
    "menu_item_queries": [
      {
        "name": "#{@search_term}"
      }
    ]
    }}

    conn = Faraday.new(:url => 'https://api.locu.com') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    data = conn.post '/v2/venue/search', request

    a = JSON.parse(data.to_json)
    b = JSON.parse(a['body'])


    # >>Restaurant Data
    # name = b[0]['venues'].name
    # phone = (Need yelp phone)
    # is_closed = (need yelp)
    # url = yelp
    # mobile_url = yelp
    # snippet_text = yelp
    # street_number = locu||yelp
    # latitude, longitude = locu||yelp
    # >>

    # >>Menu Item
    # name = b[0]['venues']['menu_items'][0]['name'] (each)
    # price = b[0]['venues']['menu_items'][0]['price'] (each)
    # >>
    b['venues']
  end
end
