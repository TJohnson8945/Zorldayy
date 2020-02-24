var bbox_side;

key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

hsp = (key_right - key_left) * 4;
vsp = (key_down - key_up) * 4;

x += hsp;
y += vsp;

