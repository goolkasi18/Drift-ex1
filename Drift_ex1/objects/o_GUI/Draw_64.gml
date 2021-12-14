/// @description x and y here should be relative to the view(port?), not the room! :)

draw_text(30, 30, "Level #"+ string(global.levelNumber));
draw_text(30, 50, "Lap #"+ string(global.lapNumber));


if(global.win && oneTime){
	instance_create_layer(0, 0, "GUI", o_wonButton);	
	oneTime = false;
}else if(global.lose){ // && oneTime?
	//instance_create_layer(640/2,360/2, "GUI", o_lostButton);	
	//oneTime = false;
}