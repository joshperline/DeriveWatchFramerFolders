Framer.Device.background.image = "http://upload.wikimedia.org/wikipedia/commons/d/d9/Lower_Central_Park_Shot_5.JPG"
Framer.Device.background.blur = 10

bg = new BackgroundLayer
bg.image = "http://upload.wikimedia.org/wikipedia/commons/d/d9/Lower_Central_Park_Shot_5.JPG"


# curve1 = "spring(300,20,50)"
curve1 = "spring(200,15,0)"
curve2 = "spring(500,25,0)"
rows = 10
width  = 630
height = 150
gutter = 8

# TITLE
textLayer = new Layer
	width:  320
	height: 80
	backgroundColor: "#00A270"
	opacity: 0.95
textLayer.html = "Derive Watch"
textLayer.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '80px'
	  	
mapLayer = new Layer
	y: 81
	width:  320
	height: 320
	backgroundColor: "#0000ff"
	opacity: 0.95
mapLayer.html = "Go Left"
mapLayer.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '590px'
mapLayer.image = "http://upload.wikimedia.org/wikipedia/commons/8/88/Singapore_Road_Signs_-_Regulatory_Sign_-_Left_Turn_Ahead_Only.svg"

mapLayer.on Events.Click, ->
	mapLayer.image = "http://upload.wikimedia.org/wikipedia/commons/3/38/Mandatory_road_sign_turn_right_ahead.svg"
	mapLayer.html = "Go Right"
