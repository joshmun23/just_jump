class FoodSearchesController < ApplicationController
  def index
    @spot = FoodSearch.new
  end

  def new
    @spot = FoodSearch.new
    @trends = FoodSearch.where("search_location iLIKE '%boston%'").order(
                                total_search_count: :desc)
  end

  def create
    @spot = FoodSearch.new(food_search_params)

    @spot = @spot.find_or_create_food_search

    if @spot.save
      @restaurant_data = FetchEats.new(food_search_params[:search_term],
                                       food_search_params[:search_location]).fetch_all_data


      @food_search_count = FoodSearch.where(food_search_params).first.total_search_count
      @food_search_string = "Users have searched #{@food_search_count} time(s) for
                             #{food_search_params[:search_term]} in
                             #{food_search_params[:search_location].capitalize}"

      @most_popular_searches = FoodSearch.where(search_location: food_search_params[:search_location])
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
