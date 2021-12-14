/// @description Initialize NPC
event_inherited();


hp = 25;
target = instance_create(x, y, obj_NPC_Target);
headstart = irandom_range(1,60*20);
boost = target.boost;
alarm[1] = headstart;


switchHit = false;
global.switchHitTimer = false;


yourX = x;
yourY = y;
yourXSpeed = phy_speed_x;
yourYSpeed = phy_speed_y;
yourRotation = phy_rotation;

theirX = obj_Player.x;
theirY = obj_Player.y;
theirXSpeed = obj_Player.phy_speed_x;
theirYSpeed = obj_Player.phy_speed_y;
theirRotation = obj_Player.phy_rotation;