class FoodSearch < ActiveRecord::Base
  #belongs_to :user

  validates :search_term,
    presence: true
  validates :search_location,
    presence: true

  def find_or_create_food_search
    food_search_params = { search_term: search_term, search_location: search_location }
    spot_exists = FoodSearch.where(food_search_params).first

    spot = !spot_exists ? FoodSearch.new(food_search_params) : spot_exists

    spot.total_search_count += 1

    spot
  end
end
