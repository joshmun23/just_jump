class FoodSearch < ActiveRecord::Base
  #belongs_to :user
  validates :search_term,
    presence: true
  validates :search_location,
    presence: true

  geocoded_by :search_location   # can also be an IP address

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city         = geo.city
      obj.state_code   = geo.state_code
      obj.zipcode      = geo.postal_code
    end
  end
  after_validation :reverse_geocode

  def find_or_create_food_search
    food_search_params = fetch_location

    spot_exists = FoodSearch.where(food_search_params).first

    spot = !spot_exists ? FoodSearch.new(food_search_params) : spot_exists

    spot.total_search_count += 1

    spot
  end

  def fetch_location
    geocode
    reverse_geocode

    search_location = Geocoder.address([latitude, longitude]).gsub(/(, USA$)/,'')

    { search_term: search_term, search_location: search_location }
  end
end
