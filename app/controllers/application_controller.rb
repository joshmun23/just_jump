class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'yelp'
  require 'net/http'
  require 'JSON'

  ##########################
  ########   APIS   ########
  ##########################

  def yelp_client
    client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                            consumer_secret: ENV['CONSUMER_SECRET'],
                            token: ENV['TOKEN'],
                            token_secret: ENV['TOKEN_SECRET']
                          })
  end

  def get_yelp_data(name)
    #data = yelp_client.search("San Francisco")
    #Sort mode: 0=Best matched (default), 1=Distance, 2=Highest Rated.
    #Sort by distance is only supported for a location or geographic search.
    #Search radius in meters. If the value is too large, a AREA_TOO_LARGE error may be returned. The max value is 40000 meters (25 miles).
    #Deals: Whether to exclusively search for businesses with deals
    data = yelp_client.search("Boston", { term: "#{name}", sort: 2, deals_filter: true }).to_json
    # limit: 5, sort: 2, radius_filter: 25, deals_filter: false
    data = JSON.parse(data).to_a
  end

  def get_yelp_restaurant(restaurant)

  end

  def locu_id(search_term="chicken parm", location="Boston")
    #https://dev.locu.com/documentation/
    api_key = ENV['LOCU_KEY']
    # "fields": [ "name", "menus", "delivery" ],

    request =
      %{{
    "api_key": "#{api_key}",
    "venue_queries": [
      {
        "location": {
          "locality": "#{location}"
        }
      }
    ],
    "menu_item_queries": [
      {
        "name": "#{search_term}"
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
