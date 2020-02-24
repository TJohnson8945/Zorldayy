
var xValue = argument0
var yValue = argument1
var xCamera = argument2
var yCamera = argument3
var widthCamera = argument4
var heightCamera = argument5
var period = argument6

//[Left, Right, Up, Down]
var boundsData

boundsData[0] = true
boundsData[1] = true
boundsData[2] = true
boundsData[3] = true
boundsData[4] = true

if xValue < xCamera - period {
	boundsData[0] = false
	
} if xValue > xCamera + widthCamera + period {
	boundsData[1] = false
		
} if yValue < yCamera - period {
	boundsData[2] = false
	
} if yValue > yCamera + heightCamera + period {
	boundsData[3] = false
		
} if !(boundsData[0] and boundsData[1] and boundsData[2] and boundsData[3]) {
	boundsData[4] = false
}

return boundsData