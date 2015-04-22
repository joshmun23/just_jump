class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  has_many :user_menu_items
  has_many :users,
    through: :user_menu_items

  validates :menu_item,
    presence: true
end
