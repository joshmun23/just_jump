class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  def index
    #access database || API to show all menu items from a restaurant with :id
    @data = get_yelp_data

    @menu_items = MenuItem.all
  end

  def new
    #store a new item to database with a restaurant :id
    @menu_item = MenuItem.new
  end

  def create
    #store a new item to database with a restaurant :id
    name = params['menu_item']['name']
    price = params['menu_item']['price']
    binding.pry
    @menu_item = MenuItem.new(menu_item_params)
  end

  def show
    #pull an item from the database matching the name of user search term
  end

  def update
    #update the price of an item(I believe this should be an array given that users could input false values)
  end

  def destroy
    #delete the menu item(adminstrative?)
  end


  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end
end
