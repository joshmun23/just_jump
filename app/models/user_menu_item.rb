class UserMenuItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :menu_item_id, presence: true

  paginates_per 9
end
