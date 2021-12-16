//Particle Systems
if(phy_speed > 1.5){

    part_emitter_region(psys, emm, x - 1, x + 1, y - 1, y + 1, ps_shape_rectangle, ps_distr_gaussian);
    inertia_dir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
    forward_dir = point_direction(x, y, x + lengthdir_x(50, -phy_rotation - 90), y + lengthdir_y(50, -phy_rotation - 90));
    
    angle_dif = abs(angle_difference(forward_dir, inertia_dir));
    
	//plays the screetching sound at more drastic turns
	if(angle_dif > 80 && angle_dif < 150){
		if (object_index == obj_Player && brakeShriek){
			audio_play_sound(SoundCarBrakeShriek, 0, false);
			brakeShriek = false;
			alarm[2] = 60;
		}
	   if (alarm[2] < 0){
		   brakeShriek = true;
	   }
	}
	
    if(angle_dif > 30 && angle_dif < 150){
	   
        //emit tyres onto floor.
        part_type_orientation(tire_part, -phy_rotation, -phy_rotation, 0, 0, 0);
        part_emitter_burst(psys, emm, tire_part, 5);
    
        //emit surface based particles.
        if(place_meeting(x,y, o_grassZone)){
            part_type_speed(dirt_part, 1, 2, 0, 0);
            part_type_orientation(dirt_part, -phy_rotation, -phy_rotation, 0, 0, 0);
            part_type_direction(dirt_part, -phy_rotation + 90, -phy_rotation + 90, 0, 0);
            part_emitter_burst(psys, emm, dirt_part, 5);
        }else{
            part_type_speed(smoke_part, 1, 2, 0, 0);
            part_type_direction(smoke_part, inertia_dir, inertia_dir, 0, 0);
            part_emitter_burst(psys, emm, smoke_part, 1);
        }   
		
		//slow the palyer
		resistance += 0.018;
		
    }
	else{
		resistance = 0;
	}
}else{resistance = 0;}