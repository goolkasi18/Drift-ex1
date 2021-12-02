/// @description Player Input

//Left Turn
if(gamepad_axis_value(0, gp_axislh) < -0.5){
    phy_rotation += (2.7 * (gamepad_axis_value(0, gp_axislh)))
}

//Right Turn
if(gamepad_axis_value(0, gp_axislh) > 0.5){
    phy_rotation += (2.7 * (gamepad_axis_value(0, gp_axislh)))
}

//Gas
gas_value = gamepad_button_value(0, gp_shoulderrb);
if(gas_value > 0.1){

    forward_x = lengthdir_x(155, -phy_rotation - 90) * gas_value;
    forward_y = lengthdir_y(155, -phy_rotation - 90) * gas_value;
    
    physics_apply_force(x, y, forward_x, forward_y);

}

//Brake
brake_value = gamepad_button_value(0, gp_shoulderlb);
if(brake_value > 0.1){

    phy_speed_x = lerp(phy_speed_x, 0, 0.05);
    phy_speed_y = lerp(phy_speed_y, 0, 0.05);    

}

//Inherit Parent
event_inherited();

