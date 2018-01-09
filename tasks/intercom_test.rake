namespace :intercom do

	desc "executes Intercom test"
	task :invite_customers, [:file_path] do |t, args|

		begin		
			raise 'No file path passed' if  args[:file_path].nil?  
			file_path = args[:file_path] 
			puts 'hola' if File.file?(file_path)
			puts 'ahola' unless File.file?(file_path)
byebug
			@customers = JSON.parse(File.read(file_path)) if File.file?(file_path)
		rescue Exception => e 
			puts e.message
		end
		
	end
end