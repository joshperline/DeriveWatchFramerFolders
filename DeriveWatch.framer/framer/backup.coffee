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
Categories = ["Food", "Cafes", "Bars", "Parks", "Museums", "Concert Halls", "Shopping"]
Restaurants = ["Great China", "Chez Panisse", "Bongo Burger", "In N Out", "Weenie Hut Jr's", "Yo Momma's", "Another Good Place"]
Friends = ["Hriday Kemburu", "Stephen Zhang", "Kent Chen", "Marcus Smith", "Eric Paulos", "Zachary Perline", "Paul Hilfinger", "Dan Garcia" ]
Features = ["Scenic", "Hilly", "Funny", "Dangerous"]
Final = [" - Food", " - at In N Out", " - with Dan Garcia", " - featuring Dangerous scenery"]

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
	  	
back = new Layer
	width:  145
	height: 150
	backgroundColor: "#007270"
	opacity: 0.95
back.html = "Back"
back.style =
	  	fontSize: '55px'
	  	textAlign: 'center'
	  	lineHeight: '145px'
	  	
#Scroll Bars
scrollingLayer1 = new Layer
	y: 150
	width:  640
	height: 1136
	backgroundColor: "rgba(0, 0, 0, 0)"
  	
scrollingLayer2 = new Layer
	x: 640
	y: 150
	width:  640
	height: 1136
	backgroundColor: "rgba(0, 0, 0, 0)"

scrollingLayer3 = new Layer
	x: 640
	y: 150
	width:  640
	height: 780
	backgroundColor: "rgba(0, 0, 0, 0)"
	
scrollingLayer4 = new Layer
	x: 640
	y: 150
	width:  640
	height: 1136
	backgroundColor: "rgba(0, 0, 0, 0)"
	
scrollingLayer5 = new Layer
	x: 640
	y: 150
	width:  640
	height: 1136
	backgroundColor: "rgba(0, 0, 0, 0)"

contentLayer = new Layer
	width:  640
	height: Categories.length * 179
	backgroundColor: "rgba(0, 0, 0, 0)"
	superLayer: scrollingLayer1
	
contentLayer2 = new Layer
	x: 640
	width: 640
	height: Restaurants.length * 179
	backgroundColor: "rgba(0, 0, 0, 0)"
	superLayer: scrollingLayer2
	
contentLayer3 = new Layer
	x: 640
	width: 640
	height: Friends.length * 179
	backgroundColor: "rgba(0, 0, 0, 0)"
	superLayer: scrollingLayer3
	
contentLayer4 = new Layer
	x: 640
	width: 640
	height: Features.length * 179
	backgroundColor: "rgba(0, 0, 0, 0)"
	superLayer: scrollingLayer4
	
contentLayer5 = new Layer
	x: 640
	width: 640
	height: Final.length * 179
	backgroundColor: "rgba(0, 0, 0, 0)"
	superLayer: scrollingLayer4
	
# Scale to 1.2 on click, return to 1 after a 0.01s delay
# Events.Click is triggered on mouseup, or touchend for touch devices
scrollingLayer1.on Events.Click, ->
  scrollingLayer1.animate
    properties:
      x: -640
    curve: curve1
  textLayer.html = "Food"
  Utils.delay 0.01, ->  
    scrollingLayer2.animate
    	properties:
	      x: 0
	    curve: curve1
	 
scrollingLayer2.on Events.Click, ->
  scrollingLayer2.animate
    properties:
      x: -640
    curve: curve1
  textLayer.html = "Friends"
  Utils.delay 0.01, ->  
    scrollingLayer3.animate
    	properties:
	      x: 0
	    curve: curve1
  Utils.delay 0.01, ->  
    friendButton.animate
    	properties:
	      x: 5
	    curve: curve1
	  
scrollingLayer1.scrollVertical = true
scrollingLayer2.scrollVertical = true
scrollingLayer3.scrollVertical = true
scrollingLayer4.scrollVertical = true

# Create each list collections
for rowIndex in [0..Categories.length-1]
	cellLayer = new Layer
		width:  width
		height: height
		x: 5
		y: rowIndex * (height + gutter)
		superLayer: scrollingLayer1
		backgroundColor: "#BBBDBB", borderRadius: "20px"
		opacity: 0.9
		
	cellLayer.html = Categories[rowIndex]
	cellLayer.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	  	
for rowIndex in [0..Restaurants.length-1]
	cellLayer = new Layer
		width:  width
		height: height
		x: 5
		y: rowIndex * (height + gutter)
		superLayer: scrollingLayer2
		backgroundColor: "#BBBDBB", borderRadius: "20px"
		opacity: 0.9
		
	cellLayer.html = Restaurants[rowIndex]
	cellLayer.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	
friendButton = new Layer
		width:  width
		height: height
		x: 640
		y: 6 * (height + gutter)
		backgroundColor: "#0000dd", borderRadius: "20px"
		opacity: 1.0
	friendButton.html = "Next"
	friendButton.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'  	
friendButton.on Events.Click, ->
	friendButton.animate
		properties:
	      x: -640
	    curve: curve2
	scrollingLayer3.animate
	    properties:
	      x: -640
	    curve: curve1
	  textLayer.html = "Features"
	  Utils.delay 0.01, ->  
	    scrollingLayer4.animate
	    	properties:
		      x: 0
		    curve: curve1
	  Utils.delay 0.01, ->  
	    featuresButton.animate
	    	properties:
	      		x: 5
	    	curve: curve1
for rowIndex in [0..Friends.length-1]
	thisY = rowIndex * (height + gutter)
	t = rowIndex in [0,3,4,7]
	bg = if t then "#00dd00" else "#BBBDBB"
	goobie = new Layer
		width:  width
		height: height
		x: 5
		y: thisY
		superLayer: scrollingLayer3
		backgroundColor: bg, borderRadius: "20px"
		opacity: 0.75
	goobie.html = Friends[rowIndex]
	goobie.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	goobie.on Events.Click, ->
	  goobie.animate
	    properties:
	      opacity: 1.0
	    curve: curve1

featuresButton = new Layer
		width:  width
		height: height
		x: 640
		y: 6 * (height + gutter)
		backgroundColor: "#0000dd", borderRadius: "20px"
		opacity: 1.0
	featuresButton.html = "Done"
	featuresButton.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
#WTF NEXT? 	  	
featuresButton.on Events.Click, ->
	featuresButton.animate
		properties:
	      x: -640
	    curve: curve2
	scrollingLayer4.animate
	    properties:
	      x: -640
	    curve: curve1
	  textLayer.html = "Good to go?"
	  Utils.delay 0.01, ->  
	    SentButton.animate
	    	properties:
		      x: 5
		    curve: curve1
	  Utils.delay 0.01, ->  
	    scrollingLayer5.animate
	    	properties:
		      x: 0
		    curve: curve1
for rowIndex in [0..Features.length-1]
	thisY = rowIndex * (height + gutter)
	monkle = new Layer
		width:  width
		height: height
		x: 5
		y: thisY
		superLayer: scrollingLayer4
		backgroundColor: "#BBBDBB", borderRadius: "20px"
		opacity: 0.75
	monkle.html = Features[rowIndex]
	monkle.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	monkle.on Events.Click, ->
	  monkle.animate
	    properties:
	      opacity: 1.0
	    curve: curve1

SentButton = new Layer
		width:  width
		height: height
		x: 640
		y: 6 * (height + gutter)
		backgroundColor: "#0000dd", borderRadius: "20px"
		opacity: 1.0
	SentButton.html = "Yes"
	SentButton.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
SentButton.on Events.Click, ->
	SentButton.animate
		properties:
	      x: -640
	    curve: curve2
	scrollingLayer5.animate
	    properties:
	      x: -640
	    curve: curve1
	  textLayer.html = "Sent!"
	  Utils.delay 0.01, ->  
	    BackButton.animate
	    	properties:
		      x: 160
		    curve: curve1

for rowIndex in [0..Final.length-1]
	thisY = rowIndex * (height)
	donkle = new Layer
		width:  width
		height: height + 10
		x: 5
		y: thisY
		superLayer: scrollingLayer5
		backgroundColor: "#BBBDBB"
		opacity: 1.0
	donkle.html = Final[rowIndex]
	donkle.style =
	  	fontSize: '45px'
	  	textAlign: 'left'
	  	lineHeight: '150px'
	  	
BackButton = new Layer
		width:  width/2
		height: height
		x: 640
		y: 3 * (height + gutter)
		backgroundColor: "#0000dd", borderRadius: "20px"
		opacity: 1.0
	BackButton.html = "Do another."
	BackButton.style =
	  	fontSize: '45px'
	  	textAlign: 'center'
	  	lineHeight: '150px'
	  	
BackButton.on Events.Click, ->
	BackButton.animate
		properties:
	      x: -640
	    curve: curve1
	scrollingLayer1.animate
	    properties:
	      x: 0
	    curve: curve1
	  textLayer.html = "Derive Watch"