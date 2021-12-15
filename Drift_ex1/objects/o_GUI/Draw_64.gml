/// @description x and y here should be relative to the view(port?), not the room! :)

draw_set_font(font_topLeft);

draw_text(30, 30, "Level # "+ string(global.levelNumber));
draw_text(30, 60, "Lap # "+ string(obj_Player.laps) + "/" + string(obj_Player.maxLaps));


if(global.won && !instance_exists(o_wonButton)){ //let's move this into the player object on finding.
	audio_play_sound_at(SoundWin, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(0, 0, "GUI", o_wonButton);	
}else if(global.lost && !instance_exists(o_lostButton)){
	audio_play_sound_at(SoundLose, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(640/2,360/2, "GUI", o_lostButton);	
}

if (room = rm_MainMenu){
	draw_text(64, room_height-128, "Created by Austin & Liam.")
}

//var pc;
pc = (180 - global.switchTime)/180 * 100;
//draw_healthbar(100, 100, 500, 200, pc, c_black, c_red, c_lime, 0, true, true)


draw_healthbar(1280/2 - 128, 720-64, 1280/2 + 128, 720-21, pc, c_black, c_red, c_lime, 0, true, true);