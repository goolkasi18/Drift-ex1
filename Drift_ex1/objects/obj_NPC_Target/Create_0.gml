/// @description Choose a random track and move
path[0] = L1_1;
path[1] = L1_2;
path[2] = L1_3;

//spd = irandom(1) + 2.0;
path_start(path[irandom(2)], 2.9 , path_action_restart, true);