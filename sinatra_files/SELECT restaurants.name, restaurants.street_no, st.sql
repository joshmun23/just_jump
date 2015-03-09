SELECT restaurants.name, restaurants.street_no, street_names.name, postal_codes.zip,
	cities.city, state_codes.state, country_codes.country
	FROM restaurants
	JOIN street_names ON street_names.id = restaurants.street_name_id
	JOIN postal_codes ON postal_codes.id = restaurants.postal_code_id
	JOIN cities ON cities.id = postal_codes.cities_id
	JOIN state_codes ON state_codes.id = cities.state_code_id
	JOIN country_codes ON country_codes.id = state_codes.country_code_id
;
