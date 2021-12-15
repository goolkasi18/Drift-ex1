/// @description x and y here should be relative to the view(port?), not the room! :)

draw_text(30, 30, "Level #"+ string(global.levelNumber));
draw_text(30, 50, "Lap #"+ string(obj_Player.laps + 1));



if(global.won && !instance_exists(o_wonButton)){ //let's move this into the player object on finding.
	audio_play_sound_at(SoundWin, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(0, 0, "GUI", o_wonButton);	
}else if(global.lost && !instance_exists(o_lostButton)){
	audio_play_sound_at(SoundLose, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(640/2,360/2, "GUI", o_lostButton);	
}