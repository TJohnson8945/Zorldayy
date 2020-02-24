
var delta = 0

switch(stepCount%80) {
	
	case 5:
		delta = 0
		break;
	case 10:
		delta = 1
		break;
	case 15:
		delta = 2
		break;
	case 20:
		delta = 3
		break;
	case 25:
		delta = 4
		break;
	case 30:
		delta = 3
		break;
	case 35:
		delta = 2
		break;
	case 40:
		delta = 1
		break;
	case 45:
		delta = 0
		break;
	case 50:
		delta = -1
		break;
	case 55:
		delta = -2
		break;
	case 60:
		delta = -3
		break;
	case 65:
		delta = -4
		break;
	case 70:
		delta = -3
		break;
	case 75:
		delta = -2
		break;
	case 80:
		delta = -1
		stepCount = 0
		break;
}

y = y + delta

stepCount++