class MenuItemsController < ApplicationController
  def index
    #access database || API to show all menu items from a restaurant with :id
  end

  def new
    #store a new item to database with a restaurant :id
  end

  def create
    #store a new item to database with a restaurant :id
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

end
