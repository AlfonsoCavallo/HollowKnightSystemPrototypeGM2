function walljump_scr() {
	//NOTA: Consente al giocatore di saltare da un muro

	//Verifica se comando di salto è attivo. Se è così effettua
	//un salto dal muro

	if(jump) {
		vspeed = - jumpspeed;
		if(place_meeting(x + 1, y, Cube_obj)) {
			hspeed = - walkspeed;
		}
		if(place_meeting(x - 1, y, Cube_obj)) {
			hspeed = walkspeed;
		}
		//cambia la direzione verso cui guarda il pg
		directionh = sign(hspeed);
		//disabilita il movimento, abilita il salto, e attiva il cooldown di walljump
		canmoveh = false;	
		jumping = true;
		alarm[4] = walljump_cooldown * room_speed;
	}


}
