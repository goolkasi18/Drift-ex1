/// @description Insert description here
// You can write your code in this editor
draw_text(30, 30, "Level #"+ string(global.levelNumber));
draw_text(30, 50, "Lap #"+ string(global.lapNumber));

if(global.win && oneTime){
instance_create_layer(640/2,360/2, "GUI", o_wonButton);	
oneTime = false;
} else if(global.lose && oneTime){
//show_debug_message("got the lose bhois");
instance_create_layer(640/2,360/2, "GUI", o_lostButton);	
oneTime = false;
}