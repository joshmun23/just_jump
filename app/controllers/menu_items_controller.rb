class MenuItemsController < ApplicationController
  respond_to :json, :html

  def index
    @spot = FoodSearch.new
    @user_menu_items = current_user.user_menu_items.order(created_at: :desc).page params[:page]
  end

  # def new
  #   binding.pry
  #   JSON.parse(info)
  #   user_id = info['current_user']

  #   user.menu_items.save
  # end

  def create
    user_id = params['currentUserID']
    menu_item_id = params['menuItemID']

    user_item = User.find(user_id).user_menu_items.new(menu_item_id: menu_item_id)

    respond_to do |format|
      format.json {
        if user_item.save
          render json: { status: 200 }
        else
          render json: { msg: 'Item Unsuccessfully Added' }
        end
      }
    end
  end

  def destroy
    user_id = params['currentUserID']
    menu_item_id = params['menuItemID']

    user_item = User.find(user_id).user_menu_items.where(menu_item_id: menu_item_id).last

    respond_to do |format|
      format.json {
        if user_item.destroy
          render json: { msg: 'Item Successfully Removed' }
        else
          render json: { msg: 'Item Unsuccessfully Removed' }
        end
      }
    end
  end
end
