/// @description CHEATS

if(keyboard_check(ord("M"))){ //win
	global.won = true;
}
if(keyboard_check(ord("K"))){ //kill
	room_goto(rm_MainMenu);
}