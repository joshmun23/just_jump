class FoodSearchesController < ApplicationController
  def create
    # @spot = FoodSearch.new
    if params[:food_search]
      spot_exists = FoodSearch.where(food_search_params).first

      @spot = !spot_exists ? @spot = FoodSearch.new(food_search_params) : spot_exists

      @spot.total_search_count += 1
      @spot.save

      @restaurant_data = FetchEats.new(food_search_params[:search_term], food_search_params[:search_location]).fetch_all_data
    end


    @spot = FoodSearch.new

    render :index
  end


  private

  def food_search_params
    params.require(:food_search).permit(:search_term, :search_location)
  end
end
