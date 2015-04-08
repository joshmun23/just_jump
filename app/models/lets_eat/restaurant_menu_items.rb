class RestaurantMenuItems < ActiveRecord::Base
  belongs_to :restaurants
  belongs_to :menu_items

  validates :menu_item_id, numericality: true
  validates :restaurant_id, numericality: true
end

