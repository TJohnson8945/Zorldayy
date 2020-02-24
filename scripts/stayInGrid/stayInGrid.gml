
var xOrYValue = argument0
var downOrRight = argument1
var gridPeriodLength = argument2

var pixelsRemaining = xOrYValue % gridPeriodLength

for (var i = gridPeriodLength; i > 0 and pixelsRemaining != 0; i /= 8) {

	if pixelsRemaining >= i {
	
		if downOrRight {
			xOrYValue += i
			
	
		} else {
			xOrYValue -= i
		}
		
		break
	}
}

return xOrYValue