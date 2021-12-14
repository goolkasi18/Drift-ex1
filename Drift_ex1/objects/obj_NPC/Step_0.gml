//my_target.path_speed = my_target.path_speed * boost;
t_dir = point_direction(x, y, my_target.x, my_target.y);
t_xd = lengthdir_x(230*boost*boost, t_dir);
t_yd = lengthdir_y(230*boost*boost, t_dir);
    
physics_apply_force(x, y, t_xd, t_yd);
phy_rotation = -t_dir - 90;

// Inherit the parent event
event_inherited();

if (hp <= 0){
	instance_destroy();
	Player.boost = 2;
	Player.alarm[1] = 60*2;
	//respawn
}