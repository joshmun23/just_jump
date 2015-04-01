class SpotsController < ApplicationController
  def index
    # if params[:menu_item] && params[:location]
      @search = { term: params[:menu_item],
                location: params[:location] }
      @all_data = FetchSpots.new(@search[:term], @search[:location]).fetch_all_data
    # end
    # if in DB
    #check is menu items exist in database already within location
    # @menu_items = Menu_item.where(name: @search[:menu_item])
    # @restaurants = Restaurant.where(id: @menu_items.id)

    #else
  end

  def new
    #curl commands? within ruby code
    # cmd = "as;dfkjsadl;kfa"
    # `#{}cmd`
  end

  private

end
