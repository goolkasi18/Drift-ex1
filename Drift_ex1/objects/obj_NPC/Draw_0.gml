/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (switchHit){
	image_blend = c_fuchsia;
	alarm[0] = 180;
	switchHit = false;
}

if (keyboard_check(vk_shift) && (image_blend = c_fuchsia)){
	yourX = x;
	yourY = y;
	theirX = obj_Player.x;
	theirY = obj_Player.y;
	
	obj_Player.x = yourX;
	obj_Player.y = yourY;
	x = theirX;
	y = theirY;
	
	image_blend = c_white;
}