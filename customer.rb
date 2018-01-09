class Customer

	def initialize(hsh_attributes)
			# This could accept more attributes but i will stick to these ones for now
		    hsh_customer = hsh_attributes.select{|k| [:name, :user_id, :latitude, :longitude].include? k.to_sym}

			hsh_customer.each do |k,v|
	      		unless v.nil?
	      			# Dinamically creates an instance variable
	      			# INFO: https://apidock.com/ruby/Object/instance_variable_set
		      		instance_variable_set("@#{k}", v)  
		      		# Dinamically creates an attr_accessor for the previous variable
		      		# INFO: https://stackoverflow.com/questions/4964179/how-do-i-set-an-attr-accessor-for-a-dynamic-instance-variable/11850739#11850739
		      		singleton_class.class_eval { attr_accessor "#{k}" }
	      		end
	    	end
    end

    def calculate_distance_to(latitude, longitude)
    	# Using Geokit gem to calculate distance beetween to GPS coordenates
    	# INFO: https://github.com/geokit/geokit
		current_location = Geokit::LatLng.new(self.latitude, self.longitude)
		destination = "#{latitude},#{longitude}"
		current_location.distance_to(destination) 
    end

end