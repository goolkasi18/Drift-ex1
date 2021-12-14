/// @description Initialize NPC
event_inherited();


hp = 4;
my_target = instance_create(x, y, obj_NPC_Target);
headstart = irandom_range(1,60*14);
boost = irandom_range(2.0,3.5);
my_target.path_speed = my_target.path_speed * boost;
alarm[1] = headstart;
alarm[2] = headstart;


switchHit = false;
global.switchHitTimer = false;


yourX = x;
yourY = y;
yourXSpeed = phy_speed_x;
yourYSpeed = phy_speed_y;
yourRotation = phy_rotation;

theirX = Player.x;
theirY = Player.y;
theirXSpeed = Player.phy_speed_x;
theirYSpeed = Player.phy_speed_y;
theirRotation = Player.phy_rotation;