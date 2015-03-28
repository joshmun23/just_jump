class Restaurant < ActiveRecord::Base
  has_many :restaurant_menu_items

  has_many :menu_items, through: :restaurant_menu_items

  belongs_to :street_name

  belongs_to :postal_code

end
