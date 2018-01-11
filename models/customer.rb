class Customer

	include GpsUtils

	attr_accessor :name, :user_id

	def initialize(hsh_attributes)
		hsh_attributes.each do |key,value|
      		unless value.nil?
      			# Dinamically creates/sets an instance variable
      			# INFO: https://apidock.com/ruby/Object/instance_variable_set
	      		instance_variable_set("@#{key}", value)  
	      		# Dinamically creates an attr_accessor method for the previous variable (Only if this method doesn't exists already)
	      		# INFO: https://stackoverflow.com/questions/4964179/how-do-i-set-an-attr-accessor-for-a-dynamic-instance-variable/11850739#11850739
	      		singleton_class.class_eval { attr_accessor "#{key}" } unless self.respond_to? key
      		end
    	end
    end

	def method_missing( method_name, *args )		
	    raise "Hey, you just called the #{method_name} method, which doesn't exist in #{self.class} class. Available instance variables: #{self.instance_variables}"
	end

	def to_s
		"Id: #{self.user_id}, Name: #{self.name}"
	end


end