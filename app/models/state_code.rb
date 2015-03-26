class StateCode < ActiveRecord::Base
  has_many :cities

  belongs_to :country_code

  validates :state_code,
    presence: true,
    uniqueness: true
end
