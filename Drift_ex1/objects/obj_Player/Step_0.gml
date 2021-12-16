/// @description Player Input

if(release){
	//~~TURNING~~
	turnValue = 0;
	//Left
	if(keyboard_check(vk_left) || keyboard_check(ord("A"))){
		turnValue += -1;
	}
	else if(gamepad_axis_value(0, gp_axislh) < -0.3){
		turnValue += gamepad_axis_value(0, gp_axislh);
	}
	//Right
	if(keyboard_check(vk_right) || keyboard_check(ord("D"))){
		turnValue += 1;
	}
	else if(gamepad_axis_value(0, gp_axislh) > 0.3){
		turnValue += gamepad_axis_value(0, gp_axislh);
	}
	phy_rotation += (3.3 * turnValue);


	//~~ACCELERATION~~
	gasValue = 0;
	if(keyboard_check(vk_up) || keyboard_check(ord("W"))){
		gasValue = 1;
	}
	else if(gamepad_button_value(0, gp_shoulderrb) > 0.2){
		gasValue += gamepad_button_value(0, gp_shoulderrb);
	}


	//~~BRAKE/REVERSE~~
	if(keyboard_check(vk_down) || keyboard_check(ord("S"))){
		gasValue = -1;
	}
	else if(gamepad_button_value(0, gp_shoulderlb) > 0.2){
		gasValue = gamepad_button_value(0, gp_shoulderlb) * -1;
	}

	forward_x = lengthdir_x(155, -phy_rotation - 90) * gasValue * boost;
	forward_y = lengthdir_y(155, -phy_rotation - 90) * gasValue * boost; 
	physics_apply_force(x, y, forward_x, forward_y);


if (!audio_is_playing(Sound_CarIdle) && gasValue == 1)
{
	show_debug_message("safsafasf");
	audio_play_sound_at(Sound_CarIdle, x, y, 0, 100, 300, 1, true, 1);
}

//play idle noise!
if (gasValue = 1 || gasValue = -1){
	//sound_volume(, 1);
	 audio_sound_gain(Sound_CarIdle, 1, 0);
	
}else{
	 audio_sound_gain(Sound_CarIdle, 0.6, 0);
}

	//Inherit Parent
	event_inherited();

	//~~SHOOTING~~
	if (keyboard_check(vk_space) && shootTime) {
		point_x = random_range(-spread*5,spread*5);
		point_y = random_range(-spread*5,spread*5);
		var b = instance_create(x,y,o_bullet);       
		b.direction = image_angle - 90;
		b.phy_speed_x = lengthdir_x(20,b.direction + point_x);
		b.phy_speed_y = lengthdir_y(20,b.direction + point_y);
		alarm[0] = 9;
		shootTime = false;
		//shoot them bullets boi
		if (alarm[2] == -1 || alarm[2] == 0)
		{
			audio_play_sound_at(SoundBullet, x, y, 0, 100, 300, 1, false, 1);
			//show_debug_message("sdfsdgds");
			alarm[2] = 10;
		}
	}

	//switchBullet on the same timer as regular ones- checks to make sure one didn't recently hit
	if (keyboard_check_pressed(vk_shift) && switchShootTime && global.switchHitTimer == false) {
		var b = instance_create(x,y,o_switchBullet);       
		b.direction = image_angle - 90;
		b.phy_speed_x = lengthdir_x(20,b.direction);
		b.phy_speed_y = lengthdir_y(20,b.direction);
		alarm[3] = 180;
		switchShootTime = false;
	}
	
	global.switchTime = alarm[3];
	
	//checkpoint collision stuff
	if (place_meeting(x,y, o_checkpoint) && (instance_place(x, y, o_checkpoint) != colliding_checkpoint_id)){
		colliding_checkpoint_id = instance_place(x, y, o_checkpoint);
	
		//# of checkpoints needed to complete a lap
		if (checkpointsCrossed < 2){
			checkpointsCrossed ++;
		}else{
			if (laps < maxLaps){
				laps ++; 
				checkpointsCrossed = 0;
			}else{
					global.won = true;
					//put the lose in here too when we have the condition
				
			}
		}
	}
}