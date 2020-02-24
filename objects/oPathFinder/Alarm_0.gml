
if random(100) >= 85 {
	var halfHeart = instance_create_depth(x, y, 0, objHearts)
	halfHeart.image_index = 1
	halfHeart.image_speed = 0
} else if random(100) >= 93 {
	var wholeHeart = instance_create_depth(x, y, 0, objHearts)
	wholeHeart.image_index = 0
	wholeHeart.image_speed = 0
}

instance_destroy(self)