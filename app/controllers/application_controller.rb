class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'yelp'

  ##########################
  ########   APIS   ########
  ##########################

  def yelp_client
    client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                            consumer_secret: ENV['CONSUMER_SECRET'],
                            token: ENV['TOKEN'],
                            token_secret: ENV['TOKEN_SECRET']
                          })

    # client = Yelp::Client.new({ consumer_key: 't1_nA-JKOW8bMfUPU4E2Og',
    #                             consumer_secret: 'qA5n9hJeIlxhrTg9tqbmrhpJbUA',
    #                             token: 'Jke9KKd71wZlv_83qKEmLGThRc2plbRP',
    #                             token_secret: 'EF5RODrw6Hgvn9v0dEnpAm97z7k'
    #                           })
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
end
