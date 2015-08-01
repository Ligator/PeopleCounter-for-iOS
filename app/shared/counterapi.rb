class CounterAPI
	def venues(&callback)
		url = "http://flextronicschallenge.herokuapp.com"
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

	def venue(venue_id, &callback)
		url = "http://flextronicschallenge.herokuapp.com"
		client = AFMotion::Client.build(url) do    
			response_serializer :json
		end 

		client.get("/venue/#{venue_id}.json") do |result|
			if result.success?
				callback.call result.object
			else
				callback.call result.error.localizedDescription
			end
		end
	end

end