# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	templateData:
		site:
			title: "屏東縣長期照顧服務教學資源網"
	collections:
        categories: ->
            @getCollection("html").findAllLive({isCategory:true})
        resources: ->
            @getCollection("html").findAllLive({isResources:true})
}

# Export the DocPad Configuration
module.exports = docpadConfig
