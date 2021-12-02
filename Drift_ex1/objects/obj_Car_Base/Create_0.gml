image_index = irandom(2);
image_speed = 0;
my_target = -1;
angle_dif = 0;

//Initialize Partical System.
psys = part_system_create();
part_system_automatic_draw(psys, false);
part_system_position(psys, 0, 0); //might be set to 0 by default. will move emmitter rather than move the system

emm = part_emitter_create(psys);

//Tire Particle
tire_part = part_type_create();
part_type_sprite(tire_part, spr_Tyre_Part, false, false, false);
part_type_life(tire_part, 30, 200); //lifetime span. min/max
part_type_alpha2(tire_part, 0.1, 0); //fade to 0

//Smoke Particle
smoke_part = part_type_create();
part_type_sprite(smoke_part, spr_Smoke_Part, false, false, false);
part_type_size(smoke_part, 0.1, 2, 0.1, 0.1);
part_type_orientation(smoke_part, 0, 359, 1, 1, 0);
part_type_life(smoke_part, 10, 200);
part_type_alpha2(smoke_part, 0.1, 0);

//Dirt Particle
dirt_part = part_type_create();
part_type_sprite(dirt_part, spr_Dirt_Part, false, false, false);
part_type_size(dirt_part, 0.1, 2, 0.02, 0.1);
part_type_life(dirt_part, 10, 60);
part_type_alpha2(dirt_part, 0.5, 0);


