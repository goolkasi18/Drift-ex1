if(released < array_length(enemy)){
	enemy[released].release = true;
	
	with(enemy[released].target){
		path_start(path[irandom(2)], 2.9*boost, path_action_restart, true);
	}
	
	released++;
	alarm[0] = AIrelease;
}

