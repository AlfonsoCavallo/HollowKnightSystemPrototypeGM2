function dash_scr() {
	//NOTE: Consente al giocatore di Dashare
	//Porta la velocità alla dash_speed, entra in fase di dash e resetta i cooldown. Impedisce altri
	//movimenti

	//Se il pg, può dashare, il comando è attivo, non sta dashando e l'analogico ha una direzione
	//aumenta la sua velocità, imposta le variabili di stato relative al dash e avvia i timer di cooldown
	if(candash && dash && !dashing) {
		//Se il pg è aggrappato ad un muro, sta guardando verso di esso. Occore imprimergli velocità negativa
		//permettergli di dashare nella direzione opposta
		if(!walled) {
			hspeed = directionh * dash_speed;
		}
		else {
			hspeed = - directionh * dash_speed;
			directionh = - directionh;
		}
		vspeed = 0;
		dashing = true;
		canmoveh = false;
		candash = false;
		alarm[2] = dash_time * room_speed;
		alarm[3] = dash_cooldown * room_speed;
	}


}
