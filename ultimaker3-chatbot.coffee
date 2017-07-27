# Description:
#	Chatbot to respond to commands given in chat

Ultimaker3Utils = require("./ultimaker3-utils")

module.exports = (robot) ->
	robot.respond /Thing1 status/i, (res) ->
		#status = robot.getStatus()
		
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
		
		#WORKING, DON'T MODIFY
		res.http("http://10.100.1.173/api/v1/print_job")#"http://10.100.1.173/log.html" "http://10.100.1.173/api/v1/system"
			.header('Accept', 'application/json')
			.get() (err, response, body) -> #.get() (err, response, body) ->
				#status = #{body}
				data = JSON.parse body
				#res.reply "Thing1 Status: #{body}"
				res.reply "Thing1 Status: #{data.name}"