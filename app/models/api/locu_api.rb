class LocuAPI
  def initialize(search_term, search_location)
    @data = nil
    @search_term = search_term
    @search_location = search_location
    @latitude = Geocoder.coordinates(@search_location)[0]
    @longitude = Geocoder.coordinates(@search_location)[1]
  end

  def locu_search
    #https://dev.locu.com/documentation/
    api_key = ENV['LOCU_KEY']
    # "fields": [ "name", "menus", "delivery" ],
    request =
      %Q{{
    "api_key": 548a64d1f75bec29bd81c99cd80cdf342589c01a,
    "fields" : [ "name", "menu_items" ],
    "venue_queries": [
      {
        "location": {
          "geo": {
           "$in_lat_lng_radius": ["#{@latitude}", "#{@longitude}", 5000.0]
          }
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

    b['venues']
  end
end
