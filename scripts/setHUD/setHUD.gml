var currentHealth = argument0
var maxHealth = argument1
var item = argument2
var key1 = argument3
var key2 = argument4
var key3 = argument5
var key4 = argument6

var heartWidth = 64
var heartSeparation = 8
var heartPeriod = heartWidth+heartSeparation

var startingX = 1824
var startingY = heartPeriod

var xValue = startingX
var yValue = startingY

var fullHeartContainers = floor(currentHealth/2)
var halfHeartContainers = currentHealth%2
var emptyHeartContainers = floor((maxHealth-currentHealth)/2)

var totalContainers = fullHeartContainers+halfHeartContainers+emptyHeartContainers

for (var i = 1; i <= totalContainers; i++) {
	if fullHeartContainers > 0 {
		draw_sprite_ext(sprHearts, 0, xValue, yValue, 2, 2, 0, c_white, 1)
		fullHeartContainers -= 1
	} else if halfHeartContainers > 0 {
		draw_sprite_ext(sprHearts, 1, xValue, yValue, 2, 2, 0, c_white, 1)
		halfHeartContainers -= 1
	} else if emptyHeartContainers > 0 {
		draw_sprite_ext(sprHearts, 2, xValue, yValue, 2, 2, 0, c_white, 1)
		emptyHeartContainers -= 1
	}
	
	if i % 3 == 0 {
		xValue = startingX
		yValue += heartPeriod
	} else {
		xValue += heartPeriod
	}
}

if item == 1 {
	draw_sprite_ext(sprSwordWooden, 0, 32, 86, 2, 2, 0, c_white, 1)
} else if item == 2 {
	draw_sprite_ext(sprSwordWhite, 0, 32, 86, 2, 2, 0, c_white, 1)
} else if item == 3 {
	draw_sprite_ext(sprSwordMagic, 0, 32, 86, 2, 2, 0, c_white, 1)
} else if item == 4 {
	draw_sprite_ext(sprRodMagic, 0, 32, 86, 2, 2, 0, c_white, 1)
} 

if key1 {
	draw_sprite_ext(sprWhiteKey, 0, 128, 86, 2, 2, 0, c_white, 1)
} if key2 {
	draw_sprite_ext(sprMagicKey, 0, 224, 86, 2, 2, 0, c_white, 1)
} if key3 {
	draw_sprite_ext(sprFireKey, 0, 320, 86, 2, 2, 0, c_white, 1)
} if key4 {
	draw_sprite_ext(sprBossKey, 0, 416, 86, 2, 2, 0, c_white, 1)
}