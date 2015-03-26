class CountryCode < ActiveRecord::Base
  validates :country_code,
    presence: true,
    uniqueness: true
end
