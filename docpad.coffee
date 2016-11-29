# DocPad Configuration File
# http://docpad.org/docs/config

# URL Config
# The production environment hosts the site under a directory instead of at
# root. The development environment hosts the site at root. So we need a way of
# switching between the two.

rooturl = "/" # Development Value
#rooturl = "/seniorcare/" # Production Value

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
categories =
	首頁:
		home: true
		icon: "fa-home"
		pic: ""
	計畫緣起:
		icon: "fa-map-o"
		pic: "box1"
		pages: ['背景', '政策', '組織', '策略規劃']
	課程與教學:
		icon: "fa-book"
		pic: "box2"
		pages: ['課程目標', '學習主題', '教學實施', '教案範例']
	熠星方案:
		icon: "fa-film"
		pic: "box3"
		pages: ['微電影', '電子書']
	教學成果:
		icon: "fa-graduation-cap"
		pic: "box4"
	長照相關連結:
		icon: "fa-camera"
		pic: "box5"
		pages: ['網路資源', '影片資源', '書籍繪本', '桌遊媒材']
# Fill out links for categories
for category,info of categories
	if info.home
		info["link"] = getPath("")
	else
		if "pages" of info
			firstPage = info.pages[0]
			info["link"] = getPath(category + "/" + firstPage + ".html")
		else
			info["link"] = getPath(category)

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
