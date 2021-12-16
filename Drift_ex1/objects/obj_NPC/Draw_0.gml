/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (switchHit){
	image_alpha = 0.6;
	alarm[0] = 180;
	switchHit = false;
}

if (keyboard_check_pressed(vk_shift) && image_alpha != 1){
	image_alpha = 1;
	yourX = phy_position_x;
	yourY = phy_position_y;
	yourXSpeed = phy_speed_x;
	yourYSpeed = phy_speed_y;
	yourRotation = phy_rotation;
	
	theirX = obj_Player.x;
	theirY = obj_Player.y;
	theirXSpeed = obj_Player.phy_speed_x;
	theirYSpeed = obj_Player.phy_speed_y;
	theirRotation = obj_Player.phy_rotation;
	
	obj_Player.phy_position_x = yourX;
	obj_Player.phy_position_y = yourY;
	obj_Player.phy_speed_x = yourXSpeed;
	obj_Player.phy_speed_y = yourYSpeed;
	obj_Player.phy_rotation = yourRotation;
	
	phy_position_x = theirX;
	phy_position_y = theirY;
	phy_speed_x = theirXSpeed;
	phy_speed_y = theirYSpeed;
	phy_rotation = theirRotation;
}

