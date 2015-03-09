# basic_layouts

restaurants = {
	"McDonald's" => {
		address: "123 Market St",
		location: "Boston, MA"
	}
}

menu_items = {
	"Chicken Parmigiana" => {
		type: :sub,
		restaurant: "Al Capone's",
		info: {
			price: 7.00,
			size: "Junior"
		}
	}
}

# data[2][1][0]["rating"]
# => 4.0
# data[2][1][0]["name"]
# => "Giacomo's Ristorante"
# data[2][1][0]["phone"]
# => "6175239026"
# data[2][1][0]["categories"]
# => [["Italian", "italian"]] # should return more array values *troubleshoot*
# data[2][1][0]['id']
# => "giacomos-ristorante-boston"
# data[2][1][0]['is_closed']
# => false
# data[2][1][0]['location']
# => {"cross_streets"=>"Tileston St & Clark St",
#  "city"=>"Boston",
#  "display_address"=>
#   ["355 Hanover St", "North End", "Boston, MA 02113"],
#  "geo_accuracy"=>8.0,
#  "neighborhoods"=>["North End"],
#  "postal_code"=>"02113",
#  "country_code"=>"US",
#  "address"=>["355 Hanover St"],
#  "coordinate"=>
#   {"latitude"=>42.3645782, "longitude"=>-71.0534363},
#  "state_code"=>"MA"}

#  data[2][1].each do |restaurant|
# 	 puts restaurant['name']

#  end
