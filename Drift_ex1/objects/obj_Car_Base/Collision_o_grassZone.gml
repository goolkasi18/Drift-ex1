if(phy_speed > 2.8){
	grass += .3;
}
else{
	grass = 0;
}

if (!offroad){
	offroad = true;
	offRoad_x = phy_position_x;
	offRoad_y = phy_position_y;
	offRoad_rot = phy_rotation;
}
