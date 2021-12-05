/// @description Player Input

//Left Turn
if(gamepad_axis_value(0, gp_axislh) < -0.5){
    phy_rotation += (2.7 * (gamepad_axis_value(0, gp_axislh)))
}

//Right Turn
if(gamepad_axis_value(0, gp_axislh) > 0.5){
	phy_rotation += (2.7 * (gamepad_axis_value(0, gp_axislh)))
	phy_rotation += (2.7 * 1);
}

//Gas
gas_value = gamepad_button_value(0, gp_shoulderrb);
if(gas_value > 0.1){
	forward_x = lengthdir_x(155, -phy_rotation - 90) * gas_value;
	forward_y = lengthdir_y(155, -phy_rotation - 90) * gas_value; 
	physics_apply_force(x, y, forward_x, forward_y);

}

//Brake
//brake_value = gamepad_button_value(0, gp_shoulderlb);
//if(brake_value > 0.1){
if(keyboard_check(vk_down)){
    phy_speed_x = lerp(phy_speed_x, 0, 0.05);
    phy_speed_y = lerp(phy_speed_y, 0, 0.05);    
}

//Inherit Parent
event_inherited();

//temp keyboard controls

//Left Turn
if(keyboard_check(vk_left)){
	phy_rotation -= (2.7 *1);
}

//Right Turn
	if(keyboard_check(vk_right)){
	phy_rotation += (2.7 * 1);
}

//Gas
if(keyboard_check(vk_up)){	
	forward_x = lengthdir_x(155, -phy_rotation - 90) * 1;
	forward_y = lengthdir_y(155, -phy_rotation - 90) * 1;
	physics_apply_force(x, y, forward_x, forward_y);
}

//Brake
if(keyboard_check(vk_down)){
    phy_speed_x = lerp(phy_speed_x, 0, 0.05);
    phy_speed_y = lerp(phy_speed_y, 0, 0.05);    
	//global.win = true;
}


if (keyboard_check(vk_space) && shootTime) {
	point_x = random_range(-spread*5,spread*5);
	point_y = random_range(-spread*5,spread*5);
	var b = instance_create(x,y,o_bullet);       
	b.direction = image_angle - 90;
	b.phy_speed_x = lengthdir_x(20,b.direction + point_x);
	b.phy_speed_y = lengthdir_y(20,b.direction + point_y);
	alarm[0] = 30;
	shootTime = false;
}

//switchBullet on the same timer as regular ones- checks to make sure one didn't recently hit
if (keyboard_check_pressed(vk_shift) && shootTime && global.switchHitTimer == false) {
	var b = instance_create(x,y,o_switchBullet);       
	b.direction = image_angle - 90;
	b.phy_speed_x = lengthdir_x(20,b.direction);
	b.phy_speed_y = lengthdir_y(20,b.direction);
	alarm[0] = 30;
	shootTime = false;
}



//checkpoint collision stuff
if (place_meeting(x,y, o_checkpoint) && (instance_place(x, y, o_checkpoint) != colliding_checkpoint_id)){
	colliding_checkpoint_id = instance_place(x, y, o_checkpoint);
	
	//# of checkpoints needed to complete a lap
	if (checkpointsCrossed < 3){
		checkpointsCrossed ++;
	}else{
		if (global.lapNumber < 2){
			checkpointsCrossed = 1;
			global.lapNumber ++; 
		}else{
				global.win = true;
				//put the lose in here too when we have the condition
				
		}
	}
}