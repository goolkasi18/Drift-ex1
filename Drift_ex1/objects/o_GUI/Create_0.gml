/// @description Insert description here
// You can write your code in this editor
global.switchTime = 0;
pc = 0;
instance_create_layer(0, 0, "GUI", o_topRightExitButton);
instance_create_layer(0, 0, "GUI", o_topRightRedoButton);

if(room == rm_NewNEWLevel3){
	audio_play_sound(SoundMusicGameAlt, 0, true);
}else{
	audio_play_sound(SoundMusicGame, 0, true);
}