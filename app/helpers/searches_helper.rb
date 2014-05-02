module SearchesHelper
  def feature_helper(restaurants)
    result = []

    @restaurants.each do |restaurant|

      next if restaurant.longitude.nil? || restaurant.latitude.nil?

      j_rest = "{'type': 'Feature',
                  'geometry': {
                    'type': 'Point',
                    'coordinates': [ #{restaurant.longitude}, #{restaurant.latitude} ]
                  },
                  'properties': {
                    'title': '#{h(restaurant.name)}',
                    'marker-color': '#c41200',
                    'marker-symbol': 'marker',
                    'marker-size': 'medium'
                  }
                }"
      result << j_rest
    end

    result.join(", ").html_safe
  end
end