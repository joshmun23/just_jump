class FoodCategory < ActiveRecord::Base
  belongs_to :restaurant

  validates :category,
    presence: true,
    uniqueness: true
end
