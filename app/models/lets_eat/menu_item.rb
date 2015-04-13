class MenuItem < ActiveRecord::Base
  belongs_to :restaurant

  validates :menu_item,
    presence: true,
    uniqueness: true
end

