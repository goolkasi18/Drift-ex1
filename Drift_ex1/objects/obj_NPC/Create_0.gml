/// @description Initialize NPC
event_inherited();
my_target = instance_create(x, y, obj_NPC_Target);

hp = 4;

switchHit = false;

yourX = x;
yourY = y;

theirX = obj_Player.x;
theirY = obj_Player.y;