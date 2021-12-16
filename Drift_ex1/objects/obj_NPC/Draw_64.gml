/// @description Insert description here
// You can write your code in this editor
if (alarm[0] > 0){
	global.switchHitTimer = true;
	draw_set_font(font_topLeft);
	draw_text(1280/2 - 86, 720-96, "Time Left " + string(round(alarm[0])));
}