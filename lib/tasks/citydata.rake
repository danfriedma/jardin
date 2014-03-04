require 'net/http'
require 'smarter_csv'

namespace :citydata do
	desc 'Fetch and save data from NYC Open Data'
	task :fetch => :environment do
		response = Net::HTTP.get('data.cityofnewyork.us', '/resource/kx9w-bns7.csv')
		filename = 'data.csv'
		open(filename, 'w') { |file| file.write(response) }
		structure = { :key_mapping => { :YEAR_of_BIRTH    => :year, 
										:GENDER 	      => :gender, 
										:CHILD_FIRST_NAME => :name, 
										:COUNT            => :count, 
										:RANK             => :rank } }
		SmarterCSV.process(filename, structure) do |array|
      	# we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
      	# when chunking is not enabled, there is only one hash in each array
      		a = Boyname.new array.first
      		a.save
  		end
  	end
end