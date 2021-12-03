/// @description Insert description here
// You can write your code in this editor
if (object_get_sprite(s_nextButton)){
	room_goto_next();
}else if (object_get_sprite(s_retryButton)){
	room_restart();
}