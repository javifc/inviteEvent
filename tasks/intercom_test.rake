namespace :intercom do

	desc "Returns a list of Customers within a radious from a given GPS Coordenates (Only file_path param is mandatory)"
	task :invite_customers, [:file_path, :latitude, :longitude, :radius, :unit ] do |t, args|


		customers_invited = []
		begin	

			set_and_validate_args(args)	

			# Read customers from JSON file
			File.read(args[:file_path]).each_line do |line|
				# Initialize and calculate distance 
				customer = Customer.new(JSON.parse(line))
				distance = customer.calculate_distance_to(@latitude, @longitude) 
				# only select customer if he/she is within the radius
				customers_invited << customer if distance <= @radius 
			end

			if customers_invited.empty?
				puts "No customers found within #{@radius} #{@unit} from Coordenates: #{@latitude}, #{@longitude}" 
			else
				# Sort customers by id
				customers_invited.sort_by!(&:user_id)
				# Display customers
				puts "List of Customers within #{@radius } #{@unit} from Coordenates: #{@latitude}, #{@longitude}"
				customers_invited.each { |customer| puts "Id: #{customer.user_id}, Name: #{customer.name}" }

			end
		rescue Exception => e 
			puts e.message
		end
	end


	private

		def set_and_validate_args(args)
			
			# If no argument is passed, it will take the values for default from Intercom Test
			@latitude =  args[:latitude].nil? ? 53.339428 : args[:latitude].to_f
			@longitude =  args[:longitude].nil? ? -6.257664 : args[:longitude].to_f
			@radius =  args[:radius].nil? ? 100 : args[:radius].to_i
			@unit = args[:unit].nil? ? :kms : args[:unit].to_sym  

			raise 'Radius has to be bigger than 0' if @radius <= 0
			raise 'No file path passed' if  args[:file_path].nil?  			
			raise '#{args[:file_path]} not found' unless File.file?(args[:file_path])
			# Accepted units : [:miles, :kms, :nms, :meters]
			raise "#{@unit} is a not accepted unit for Geokit gem. More info: https://github.com/geokit/geokit" unless [:miles, :kms, :nms, :meters].include? @unit	
			Geokit::default_units = @unit

		end
end