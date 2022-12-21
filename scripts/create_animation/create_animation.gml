function create_animation(argument0, argument1, argument2, argument3) {
	//Crea un'animazione
	//argument 0 = x
	//argument 1 = y
	//argument 2 = layer
	//argument 3 = oggetto

	var i
	i = instance_create_layer(argument0, argument1, argument2, argument3)
	with(i) {
		alarm[0] = (sprite_get_number(sprite_index) / sprite_get_speed(sprite_index)) * room_speed;
	}


}
