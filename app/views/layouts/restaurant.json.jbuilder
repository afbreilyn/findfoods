json.key_format! ->(key){ key.gsub(/_/, "-") }

geolistings = restaurants.reject{|restaurant| restaurant.address.longitude.blank? || restaurant.address.latitude.blank? }

json.array!(geolistings) do |restaurant|
    json.type "Feature"
    
		json.geometry do
      json.type "Point"
      json.coordinates [restaurant.address.longitude, restaurant.address.latitude]
    end

    json.properties do 
      json.title "<a href=\'#{restaurant.name}</a>"
      json.marker_color "#c41200",
      json.marker-symbol: "marker",
      json.marker-size: "medium"
    end
end