// Inherit the parent event
event_inherited();

crashSound = true;
shootTime = true;
switchShootTime = true;
spread = 0.2;
laps = 0;
checkpointsCrossed = 2;
//checkpointReady = true;

colliding_checkpoint_id = noone;

engineSound = false;

if (room = rm_NewNEWLevel){
	maxLaps = 3;
} else
{
	maxLaps = 3;	
}

revSoundTrigger = true;