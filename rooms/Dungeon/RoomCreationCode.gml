
for (var i = 0; i < 38; i++) {
	for (var j = 0; j < 63; j++) {
		instance_create_layer(i*64, j*64, "Enemy_Collision", wall)
	}
}

for (var i = 105; i < 157; i++) {
	for (var j = 0; j < 63; j++) {
		instance_create_layer(i*64, j*64, "Enemy_Collision", wall)
	}
}

for (var i = 38; i < 105; i++) {
	for (var j = 0; j < 11; j++) {
		instance_create_layer(i*64, j*64, "Enemy_Collision", wall)
	}
}