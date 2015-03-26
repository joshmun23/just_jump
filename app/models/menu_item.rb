class MenuItem < ActiveRecord::Base
  has_many :restaurant_menu_items
  has_many :restaurants, through: :restaurant_menu_items

  validates :name, presence: true

  def save_menu_items(info)
    # binding.pry
    # r = {}
    # m = {}

    # info.each do |restaurant|
    #   r['name'] = restaurant['name']
    #   r['locality'] = restaurant['location']['locality']

    #   request = "#{r['name'].split(' ').join('-')}-#{r['locality']}"
    #   r_data = yelp_client.business(request)
    #   r_data = JSON.parse(r_data.to_json)

    #   binding.pry
    #   r['phone'] = r_data['phone']
    #   r['is_closed'] = r_data['is_closed']
    #   r['url'] = r_data['url']
    #   r['street_number'] = restaurant['location']['address1'].split(' ').first
    #   r['longitude'] = r_data['location']['coordinate']['longitude'].to_f
    #   r['latitude'] = r_data['location']['coordinate']['latitude'].to_f

    #   restaurant['menu_items'].each do |menu_item|
    #     m['name'] = menu_item['name']
    #     m['price'] = menu_item['price'].to_f
    #   end
    #   binding.pry
    # end

  end
end

