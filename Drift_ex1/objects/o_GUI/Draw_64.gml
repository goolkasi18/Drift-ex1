/// @description x and y here should be relative to the view(port?), not the room! :)

draw_set_font(font_topLeft);

draw_text(30, 30, "Level # "+ string(global.levelNumber));
draw_text(30, 60, "Lap # "+ string(obj_Player.laps) + "/" + string(obj_Player.maxLaps));


if(global.won && !instance_exists(o_wonButton)){ //let's move this into the player object on finding.
	audio_play_sound_at(SoundWin, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(0, 0, "GUI", o_wonButton);	
	draw_sprite(s_youWin, -1, (1280/2- s_youWin.sprite_width/2), 0);
}else if(global.lost && !instance_exists(o_lostButton)){
	audio_play_sound_at(SoundLose, x, y, 0, 100, 300, 1, false, 1);
	instance_create_layer(640/2,360/2, "GUI", o_lostButton);
	draw_sprite(s_youLose, -1, (1280/2- s_youLose.sprite_width/2), 0);
}

//var pc;
pc = (180 - global.switchTime)/180 * 100;

draw_healthbar(1280/2 - 128, 720-64, 1280/2 + 128, 720-21, pc, c_black, c_red, c_lime, 0, true, true);

draw_set_font(font_bottomSwitchBar);
show_debug_message(string(pc));
if (pc >= 100){
	draw_text(1280/2 - 126, 720-54, "Switch Bullet READY");
}else{
	draw_text(1280/2 - 126, 720-54, "Switch Bullet NOT READY");
}