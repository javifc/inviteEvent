module GpsUtils

	ACCEPTED_UNITS =  [:miles, :kms, :nms, :meters]

	attr_accessor :latitude, :longitude

    # Using Geokit gem to calculate distance beetween to GPS coordenates
    # INFO: https://github.com/geokit/geokit
    def calculate_distance_to(latitude, longitude, unit)    	
		raise "#{unit} is a not a valid unit. Accepted units: #{ACCEPTED_UNITS}. More info: https://github.com/geokit/geokit" unless ACCEPTED_UNITS.include? unit.to_sym
    	Geokit::default_units = unit
		current_location = Geokit::LatLng.new(self.latitude, self.longitude)
		destination = "#{latitude},#{longitude}"
		current_location.distance_to(destination) 
    end

end