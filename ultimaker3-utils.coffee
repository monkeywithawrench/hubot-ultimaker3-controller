# Description:
#	Utility functions to interface with the Ultimaker3 API

#http = require('http')
require('http')
rp = require('request-promise')

#alert = require('alert')
#require('alert')


Thing1IP = "10.100.1.173"
Thing2IP = "10.100.1.203"

module.exports = (robot) ->
	
	# ##
	getStatus = (res) ->
		res.response = ""
		## # DEFAULT HUBOT STYLE
		robot.http("http://"+Thing1IP+"/api/v1/printer")
		#robot.http("10.1.100.173/api/v1/printer")
		#http("http: //www.ihmc.us")
			## #
			.get() (err, response, body) ->
				status = "#{body}"
				#alert("#{body}")
				res.reply "#{JSON.stringify(body)}"
				#THIS DOESN'T PRINT# res.response += "beep "
				return status #"#{body}"
			# ## 
			#.get() (err, res, body) ->
			#.get() #->
			#	return #return JSON.parse(res)
			# .header('Accept', 'application/json')
			#THIS PRINTS# res.response += "boop "
		# ##
		#THIS PRINTS# res.response += "bonk"
	robot.getStatus = getStatus
	## #
	
	###I really wish I could remember what I was doing here
	getStatus = (res) ->
		results = ""
		Promise.when(
			robot.http(Thing1IP+"/api/v1/printer")
				.get() (err, response, body) ->
					results = "#{body}"
		).then((results) ->
			res.reply "Thing1 data?!: "+results
			return results
		)
	###
	
	#Promises using "request" and "request-promise"
	###
	# WORKING!
	getStatus = (res) ->
		options = 
			uri: 'http: //10.100.1.173/api/v1/printer', #REMOVE SPACE!
			json: true
			resolveWithFullResponse: true
		rp(options).then((data) ->
			res.reply "Thing1 Data: #{JSON.stringify(data.body)}"
			console.log(data.body)
			return "#{JSON.stringify(data.body)}"
		).catch (err) ->
			# API call failed... 
			res.reply "SOMETHING WENT WRONG!!!: #{err}"
			return
	robot.getStatus = getStatus
	###
	
	
	
	
	
	
	
	#My way (using NodeJS's own http library, rather than hubot's "scoped http client"
	
	
	#MY HTTP GET UTILITY FUNCTIONS
	# NOTE: LINES ENCLOSED WITH ` ARE JAVASCRIPT, NOT COFFEESCRIPT
	#NOTE: THIS WORKS, IT JUST DOESN'T RETURN A PROMISE!!!
	getHttpJson = (ip, path, res) ->
		options = { hostname: ip, path: path }
		data = ""
		data = `http.get(options, (res) => { //#nodejs code
			res.setEncoding('utf8');
			let rawData = '';
			res.on('data', (chunk) => { rawData += chunk; });
			res.on('end', () => {
				console.log(rawData); //WE ARE SUCCESSFULLY LOGGING TO CONSOLE!
				res.data = rawData; //res.write(rawData);
			});
		//#res.send(req);
		}); `
		#back to coffeescript
		#res.reply "Thing1 Status: #{data}"
		data
	robot.getHttpJson = getHttpJson
