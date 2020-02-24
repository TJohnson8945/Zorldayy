
var hp = argument0
var maxHp = argument1
var spawnX = argument2
var spawnY = argument3
var imageIndex = argument4
var xScale = argument5
var yScale = argument6
var hSpeed = argument7
var vSpeed = argument8
var usingItem = argument9
var itemHeld = argument10

//If hp is max and swinging sword, swawn a blast that will despawn
if usingItem and (hp == maxHp or itemHeld == 4) {
	var blast = instance_create_depth(spawnX, spawnY, -1, objSwordBlast)
	blast.image_index = imageIndex
	blast.image_xscale = xScale
	blast.image_yscale = yScale
	blast.hspeed = hSpeed
	blast.vspeed = vSpeed
	blast.image_speed = 0
	blast.item = itemHeld
}