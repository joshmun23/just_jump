class Restaurant < ActiveRecord::Base
  has_many :menu_items
  belongs_to :street_name
  belongs_to :postal_code
end
