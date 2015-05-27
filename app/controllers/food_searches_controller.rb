class FoodSearchesController < ApplicationController
  def index
    @spot = FoodSearch.new
  end

  def new
    @spot = FoodSearch.new
    @trends = FoodSearch.where("city iLIKE '%boston%'").order(
                                total_search_count: :desc)
  end

  def create
    if current_user
      current_user.last_search_location = food_search_params[:search_location]
      current_user.save
    end

    @spot = FoodSearch.new(food_search_params)

    @spot = @spot.find_or_create_food_search
    @spot.geocode
    @spot.reverse_geocode

    if @spot.save
      @restaurant_data = FetchEats.new(
        @spot[:search_term],
        @spot[:search_location]
      ).fetch_all_data

      @food_search_count = FoodSearch.where(
        search_term: @spot.search_term,
        city: @spot.city,
        state_code: @spot.state_code
      ).first.total_search_count

      @food_search_string = "Users have searched #{@food_search_count} time(s) for
                             #{@spot.search_term} in
                             #{@spot.city}, #{@spot.state_code}"

      @most_popular_searches = FoodSearch.where(
        city: @spot.city, state_code: @spot.state_code)
      @most_popular_searches = @most_popular_searches.order(total_search_count: :desc)

      @spot = FoodSearch.new

      render :index
    else
      flash[:notice] = @spot.errors.full_messages.join(', ')
      redirect_to new_food_search_path
    end
  end

  private

  def food_search_params
    params.require(:food_search).permit(:search_term, :search_location)
  end
end
