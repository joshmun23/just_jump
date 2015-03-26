class City < ActiveRecord::Base
  has_many :postal_codes

  belongs_to :state_code

  validates :city,
    presence: true,
    uniqueness: true
end
