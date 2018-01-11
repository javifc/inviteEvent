require 'spec_helper'

describe  Customer  do

	it_behaves_like "gps" # This executes the tests for the module GPSUtils 

	it 'Creates a new Customer with default + dynamic methods from a hash of attributes' do
	   	new_stub_customer_hsh = stub_customer_hsh.merge!({new_method: "abc"})
    	customer = create_customer_and_test_default_methods(new_stub_customer_hsh)
    
    	expect(customer).to respond_to(:new_method) 
		expect(customer.new_method).to eq new_stub_customer_hsh[:new_method]
	end

	it 'Raises exception when it tries to access to a non existing method' do
    	customer = create_customer_and_test_default_methods(stub_customer_hsh)

		expect { raise customer.non_existing_method }.to raise_error.with_message(/Hey, you just called the non_existing_method method, which doesn't exist in Customer class./)

	end

	it 'Returns customer info when calling to_s method' do
		customer = create_customer_and_test_default_methods(stub_customer_hsh) 
		expect(customer.to_s).to eq "Id: #{stub_customer_hsh[:user_id]}, Name: #{stub_customer_hsh[:name]}"
	end


	def create_customer_and_test_default_methods(hsh)
		
		customer = Customer.new(hsh)    	

		expect(customer).to respond_to(:longitude) 
		expect(customer).to respond_to(:latitude) 
		expect(customer).to respond_to(:user_id) 
		expect(customer).to respond_to(:name) 

		expect(customer).to respond_to(:calculate_distance_to) 

		expect(customer.longitude).to eq hsh[:longitude]
		expect(customer.latitude).to eq hsh[:latitude]
		expect(customer.user_id).to eq hsh[:user_id]
		expect(customer.name).to eq hsh[:name]

		customer
	end
end