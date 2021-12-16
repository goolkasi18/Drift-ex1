if(release){
	//target.path_speed = my_target.path_speed * boost;
	t_dir = point_direction(x, y, target.x, target.y);
	t_xd = lengthdir_x(475*boost*boost, t_dir);
	t_yd = lengthdir_y(475*boost*boost, t_dir);
    
	physics_apply_force(x, y, t_xd, t_yd);
	phy_rotation = -t_dir - 90;

	// Inherit the parent event
	event_inherited();

	if (hp <= 0){
		instance_destroy();
		obj_Player.boost = 2;
		obj_Player.alarm[1] = 60*2;
		//respawn
	}
}