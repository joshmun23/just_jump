class PostalCode < ActiveRecord::Base
  has_many :street_names

  belongs_to :neighborhood

  belongs_to :city

  validates :postal_code,
    presence: true,
    uniqueness: true
end
