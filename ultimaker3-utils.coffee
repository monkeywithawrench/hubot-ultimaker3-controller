# Description:
#	Utility functions to interface with the Ultimaker3 API

Thing1IP = "10.100.1.173"
Thing2IP = "10.100.1.203"

module.exports = (robot) ->
	
	getStatus = ->
		#robot.http(Thing1IP+"/api/v1/printer")
		#robot.http("10.1.100.173/api/v1/printer")
		http("http://www.ihmc.us")
			.get() (err, response, body) ->
				status = "#{body}"
				return status #"#{body}"
			#.get() (err, res, body) ->
			#.get() #->
			#	return #return JSON.parse(res)
			# .header('Accept', 'application/json')
			
	robot.getStatus = getStatus