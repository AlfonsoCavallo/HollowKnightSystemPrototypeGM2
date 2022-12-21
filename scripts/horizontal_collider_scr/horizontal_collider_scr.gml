function horizontal_collider_scr() {
	//NOTE: La funzione impedisce che le hitbox si sovrappongano orizzontalmente

	//Stesso principio del vertical_collider_scr ma in orizzontale
	if(place_meeting(x + hspeed, y, Cube_obj)) {
		while(!place_meeting(x + 1 * sign(hspeed), y, Cube_obj)) {
			x += sign(hspeed) * 1;
		}
		hspeed = 0;
		//Se non si è a terra considera il pg aggrappato e ne resetta la possibilità di saltare
		if(!grounded) {
		walled = true;
		jumping = false;
		airjumping = false;
		candash = true;
		}
	}

	//Se non si è vicino a muro, non si è più aggrappati
	if(!place_meeting(x + 1, y, Cube_obj) && !place_meeting(x - 1, y, Cube_obj)) {
		walled = false;
	}



}
