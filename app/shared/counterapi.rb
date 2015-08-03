class CounterAPI
	def venues(&callback)
		url = ADDRESS
		client = AFMotion::Client.build(url) do    
			response_serializer :json
		end 

		client.get("/venues.json") do |result|
			if result.success?
				callback.call result.object
			else
				callback.call result.error.localizedDescription
			end
		end
	end

	def details(venue_id, &callback)
		url = ADDRESS
		client = AFMotion::Client.build(url) do    
			response_serializer :json
		end 

		client.get("/venues/#{venue_id}.json") do |result|
			# p result
			if result.success?
				callback.call result.object
			else
				callback.call result.error.localizedDescription
			end
		end
	end

end