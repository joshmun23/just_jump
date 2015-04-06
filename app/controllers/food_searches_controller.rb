class FoodSearchesController < ApplicationController
  def create
    # @spot = FoodSearch.new
    if params[:food_search]
      spot_exists = FoodSearch.where(food_search_params).first

      @spot = !spot_exists ? @spot = FoodSearch.new(food_search_params) : spot_exists

      @spot.total_search_count += 1
      @spot.save

      @restaurant_data = FetchEats.new(food_search_params[:search_term],
                                       food_search_params[:search_location]).fetch_all_data

      @food_search_count = FoodSearch.where(food_search_params).first.total_search_count
      @food_search_string = "Users have searched #{@food_search_count} time(s) for
                             #{food_search_params[:search_term]} in
                             #{food_search_params[:search_location].capitalize}"

      @most_popular_searches = FoodSearch.where(search_location: food_search_params[:search_location])
      @most_popular_searches = @most_popular_searches.order(total_search_count: :desc)
    end

    @spot = FoodSearch.new

    render :index
  end


  private

  def food_search_params
    params.require(:food_search).permit(:search_term, :search_location)
  end
end
