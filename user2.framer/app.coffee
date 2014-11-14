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
gutter = 18

# TITLE
textLayer = new Layer
	width:  640
	height: 150
	backgroundColor: "#00A270"
	opacity: 0.95
textLayer.html = "Derive Watch"
textLayer.style =
	  	fontSize: '55px'
	  	textAlign: 'center'
	  	lineHeight: '145px'
	  	
BackButton = new Layer
		width:  width/1.2
		height: height
		x: 53
		y: 3 * (height + gutter)
		backgroundColor: "#dd0000", borderRadius: "20px"
		opacity: 1.0
	BackButton.html = "New Notification!"
	BackButton.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'

textThing = new Layer
		width:  width/1.2
		height: height
		x: 640
		y: 3 * (height + gutter)
		backgroundColor: "#111111", borderRadius: "20px"
		opacity: 1.0
	textThing.html = "Go to the watch!"
	textThing.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'

y = new Layer
		width:  width/1.2
		height: height
		x: 640
		y: 3 * (height + gutter)
		backgroundColor: "#00ee00", borderRadius: "20px"
		opacity: 1.0
	y.html = "Accept"
	y.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	  		  	
n = new Layer
		width:  width/1.2
		height: height
		x: 640
		y: 4 * (height + gutter)
		backgroundColor: "#dd0000", borderRadius: "20px"
		opacity: 1.0
	n.html = "Decline"
	n.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
  	
BackButton.on Events.Click, ->
	BackButton.animate
		properties:
	      x: -640
	    curve: curve1
	y.animate
	    properties:
	      x: 53
	    curve: curve1
    n.animate
	    properties:
	      x: 53
	    curve: curve1
	  textLayer.html = "Derive Watch"
	  
y.on Events.Click, ->
	textThing.animate
	    properties:
	      x: 50
	    curve: curve1
	y.animate
	    properties:
	      x: -640
	    curve: curve1
    n.animate
	    properties:
	      x: -640
	    curve: curve1
	  textLayer.html = "Derive Watch"