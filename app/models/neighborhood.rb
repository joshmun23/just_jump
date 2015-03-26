class Neighborhood < ActiveRecord::Base
  has_many :postal_codes

  validates :neighborhood, presence: true
end
