if(offroad){
	//audio_play_sound_at(SoundCrashIntoWall, x, y, 0, 50, 100, 1, false, 1);
	phy_position_x = offRoad_x;
	phy_position_y = offRoad_y;
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_rotation = offRoad_rot; 
}