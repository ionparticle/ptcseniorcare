# DocPad Configuration File
# http://docpad.org/docs/config

# URL Config
# The production environment hosts the site under a directory instead of at
# root. The development environment hosts the site at root. So we need a way of
# switching between the two.

rooturl = "/" # Development Value
#rootlurl = "/seniorcare/" # Production Value

typeLink = "Link"
typeCSS = "CSS"
typeImg = "Image"
getPath = (relpath, type=typeLink) ->
	if type is typeCSS
		return rooturl + "css/" + relpath
	else if type is typeImg
		return rooturl + "images/" + relpath
	else
		return rooturl + relpath

# Define the DocPad Configuration
docpadConfig = {
	templateData:
		site:
			title: "屏東縣長期照顧服務教學資源網"
			categories: categories
		getPath: (relpath="") -> getPath(relpath)
		getImgPath: (relpath) -> getPath(relpath, typeImg)
		getCssPath: (relpath) -> getPath(relpath, typeCSS)
	collections:
		categories: ->
			@getCollection("html").findAllLive({isCategory:true})
		resources: ->
			@getCollection("html").findAllLive({isResources:true})
}

# Export the DocPad Configuration
module.exports = docpadConfig
