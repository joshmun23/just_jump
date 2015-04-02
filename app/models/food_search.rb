class FoodSearch < ActiveRecord::Base
  #belongs_to :user

  validates :search_term,
    presence: true
  validates :search_location,
    presence: true

  def add_to_counter
    #increment total search for term and location here
  end
end
