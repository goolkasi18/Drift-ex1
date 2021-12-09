/// @description Insert description here
// You can write your code in this editor
draw_text(30, 30, "Level #"+ string(global.levelNumber));
draw_text(30, 50, "Lap #"+ string(global.lapNumber));

//gui_x = device_mouse_x_to_gui(0)
//gui_y = device_mouse_y_to_gui(0)
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);


//if(global.win && oneTime){
if(global.win){
draw_sprite(s_nextButton,0,view_wport[0]/2, view_hport[0]/2);
//if (point_in_rectangle(mouse_x, mouse_y, view_wport[0]/2, view_hport[0]/2,view_wport[0]/2 + 64,view_hport[0]/2 + 64)) {
if (point_in_rectangle(mousex, mousey, view_wport[0]/2, view_hport[0]/2, 300,300)) {
 //  if(mouse_check_button(mb_left)) {
	   show_debug_message("yahoooooo");
	   room_goto_next();
 //  }
}


//instance_create_layer(640/2,360/2, "GUI", o_wonButton);	
//oneTime = false;
//} else if(global.lose && oneTime){
 


} else if(global.lose){


//show_debug_message("got the lose bhois");
//instance_create_layer(640/2,360/2, "GUI", o_lostButton);	
//oneTime = false;
}