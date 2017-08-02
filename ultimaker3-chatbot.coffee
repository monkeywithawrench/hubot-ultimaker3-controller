# Description:
#	Chatbot to respond to commands given in chat

Ultimaker3Utils = require("./ultimaker3-utils")

Thing1IP = "10.100.1.173"
Thing2IP = "10.100.1.203"

module.exports = (robot) ->
	robot.respond /Thing1 status/i, (res) ->
		
		#status = robot.getHttpJson(Thing1IP, "/api/v1/print_job", res)
		status = robot.getStatus(res)
		res.reply "Thing1 Status: #{JSON.stringify(status)}"
		#console.log(status)
		
		
		
		
		#status = robot.getStatus()
		#status = robot.getStatus(res)
		#res.reply "Thing1 Status: #{status}"
		
		#THIS IS WORKING. DON'T MODIFY.
		# res.http("http ://www.ihmc.us")#
		#	.get() (err, response, body) ->
		#		#status = #{body}
		#		res.reply "Thing1 Status: #{body}"
		
		#status = robot.getStatus()
		#status=""
		#THIS IS WORKING. DON'T MODIFY.
		# obj = this
		# res.http("http: //www.ihmc.us") 
			# .get() (err, response, body) ->
				# res.reply "Thing1 Status: #{body}"
				# robot.status = body
		# res.reply "Thing1 Status: "+robot.status
		
		#obj = this
		#obj.status = ""
		#obj.status = res.http("http: //www.ihmc.us") 
		#	.get() (err, response, body) ->
		#		#res.reply "Thing1 Status: #{body}"
		#		#obj.status = body
		#		return body
		#res.reply "Thing1 Status: "+obj.status
		#res.reply "Thing1 Status: "+"#{obj.status}"
		
		### WORKING, DON'T MODIFY
		res.http("http:// 10.100.1.173/api/v1/print_job")#"http: //10.100.1.173/log.html" "http: //10.100.1.173/api/v1/system"
			.header('Accept', 'application/json')
			.get() (err, response, body) -> #.get() (err, response, body) ->
				#status = #{body}
				data = JSON.parse body
				#res.reply "Thing1 Status: #{body}"
				res.reply "Thing1 Status: #{data.name}"
		
		###
		
		
		
		
		#Begin Actual code... /sigh
		return
	###
	robot.respond /status (.*)/i, (res) ->
		thing = res.match[1].toLowerCase()
		if(thing is "thing1")
			thingIP = Thing1IP
		else if (thing is "thing2")
			thingIP = Thing2IP
		else
			res.reply "#{res.match[1]} is not a valid name! Valid names are _Thing1_ or _Thing2_."
			return
		
		#If we made it this far, we SHOULD have a valid IP address!
	###	