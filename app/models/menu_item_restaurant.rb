class RestaurantMenuItems < ActiveRecord::Base
  validates :menu_item_id, numericality: true

  validates :restaurant_id, numericality: true

  belongs_to :restaurants

  belongs_to :menu_items
end

