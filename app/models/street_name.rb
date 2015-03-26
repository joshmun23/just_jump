class StreetName < ActiveRecord::Base
  belongs_to :postal_code

  has_many :restaurants

  validates :street_name, presence: true

  validates :postal_code_id,
    numericality: true,
    presence: true
end
