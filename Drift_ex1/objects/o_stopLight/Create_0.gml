for (var i=0; i<instance_number(obj_NPC); i++;){
    enemy[i] = instance_find(obj_NPC,i);
}
released = 0;

startGameTime = 60*4;
AIrelease = startGameTime/(array_length(enemy)+2);

alarm[0] = AIrelease;

alarm[1] = startGameTime/4;