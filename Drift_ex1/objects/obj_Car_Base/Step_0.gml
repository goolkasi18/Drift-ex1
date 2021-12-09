//NPC AI
if(my_target != -1){
    
    t_dir = point_direction(x, y, my_target.x, my_target.y);
    t_xd = lengthdir_x(160, t_dir);
    t_yd = lengthdir_y(160, t_dir);
    
    physics_apply_force(x, y, t_xd, t_yd);
    phy_rotation = -t_dir - 90;

}

//Particle Systems
if(phy_speed > 1){

    part_emitter_region(psys, emm, x - 1, x + 1, y - 1, y + 1, ps_shape_rectangle, ps_distr_gaussian);
    inertia_dir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
    forward_dir = point_direction(x, y, x + lengthdir_x(50, -phy_rotation - 90), y + lengthdir_y(50, -phy_rotation - 90));
    
    angle_dif = abs(angle_difference(forward_dir, inertia_dir));
    
    if(angle_dif > 20){
        
        //emit tyres onto floor.
        part_type_orientation(tire_part, -phy_rotation, -phy_rotation, 0, 0, 0);
        part_emitter_burst(psys, emm, tire_part, 5);
    
        //emit surface based particles.
        if(place_meeting(x,y, obj_Grass_Zone)){
            part_type_speed(dirt_part, 1, 2, 0, 0);
            part_type_orientation(dirt_part, -phy_rotation, -phy_rotation, 0, 0, 0);
            part_type_direction(dirt_part, -phy_rotation + 90, -phy_rotation + 90, 0, 0);
            part_emitter_burst(psys, emm, dirt_part, 5);
        }else{
            part_type_speed(smoke_part, 1, 2, 0, 0);
            part_type_direction(smoke_part, inertia_dir, inertia_dir, 0, 0);
            part_emitter_burst(psys, emm, smoke_part, 1);
        }   
    }
}

 if(place_meeting(x,y, o_deathZone)){

phy_position_x = offRoad_x;
phy_position_y = offRoad_y;
phy_speed_x = 0;
phy_speed_y = 0;
phy_rotation = offRoad_rot; 
 }
 
//check to see if you're leaving the road, and saving 
//that point until you are back on the road
if (roadCheck && !place_meeting(x,y, o_road)){
	
	offRoad_x = phy_position_x;
	offRoad_y = phy_position_y;
	offRoad_rot = phy_rotation;
	

	roadCheck = false;
}
if (!roadCheck && place_meeting(x,y, o_road)){
//thought this might help orient car in right direction when spawns... but I dont think its possible
//var colliding_road = instance_place(x, y, o_road);
//if get
	
	
	roadCheck = true;
}