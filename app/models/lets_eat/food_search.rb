class FoodSearch < ActiveRecord::Base
  #belongs_to :user

  validates :search_term,
    presence: true
  validates :search_location,
    presence: true

  def find_or_create_food_search
    spot_exists = FoodSearch.where(search_term: search_term,
                                   search_location: search_location).first

    spot = !spot_exists ? FoodSearch.new(food_search_params) : spot_exists

    spot.total_search_count += 1

    spot
  end
end
