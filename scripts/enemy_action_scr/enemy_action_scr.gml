function enemy_action_scr() {
	//REGOLA IL COMPORTAMENTO DEL NEMICO

#region //COMPORTAMENTO IN STATO DI ALLERTA
	//Se è in allerta e vede il pg triggera l'attacco e memorizza la direzione
	if(aggro_status == 1 && !stunned) {
		if(distance_to_object(Pg_obj) <= 320) {
			aggro_dir = sign(Pg_obj.x - x);
			create_animation(x, y, "Instances", Esclamation_point_anm);
			aggro_status = 2;
		}
	}

#endregion
#region //COMPORTAMENTO IN STATO DI ATTACCO

	//Se lo colpisce resetta l'aggro con un cooldown di 6

	if(aggro_status == 2 && place_meeting(x, y, Pg_obj)) {
		aggro_status = 3;
		alarm[0] = 6 * room_speed;
	}

	//Se lo supera entra in fase di riposo con una ricarica inferiore. Se impatta col muro si ferma.
	//entra in stato di riposo e attiva il timer di riposo

	if(aggro_status == 2) {
		if(sign(Pg_obj.x - x) == aggro_dir) {
			if(!place_meeting(x + 10*aggro_dir,y,Cube_obj)) {
				hspeed = 10 * aggro_dir;
			}
			else {
				aggro_status = 3;
				alarm[0] = 5 * room_speed;
			}
		}
		else {
			aggro_status = 3;
			alarm[0] = 3 * room_speed;
		}
	}

	//Se entra in contatto con il pg lo respinge e lo danneggia

	if(place_meeting(x, y, Pg_obj) && !Pg_obj.invincible) {
		Pg_obj.life--;
		Pg_obj.stunned = true;
		Pg_obj.invincible = true;
		Pg_obj.vspeed = - 10;
		Pg_obj.hspeed = - Pg_obj.directionh * 10;
		Pg_obj.alarm[0] = 0.5 * room_speed;
		Pg_obj.alarm[5] = 1 * room_speed;
	}

#endregion


}
