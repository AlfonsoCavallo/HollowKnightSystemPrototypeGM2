function horizontal_movement_scr() {
	//NOTE: Questa funzione crea un movimento orizzontale che raggiunge una velocità massima pari
	//a una frazione della walkspeed dell'oggetto stabilità in base all'inclinazione dell'analogico.
	//La funzione arrotonda la velocità alla walkspeed se il guadagno non la eccederebbe di troppo.
	//così da funzionare anche in caso di grandi spinte.

	//Imposta la percentuale di velocità massima raggiungibile mediante l'analogico
	if(!move_keypressed && abs(gamepad_axis_value(4, gp_axislh)) >= 0.3) {
	walkfract = abs(gamepad_axis_value(4, gp_axislh));
	}
	else walkfract = 1;
	//Se il pg si sta muovendo con un tasto, è a terra e si può muovere aumenta la sua velocità
	if(abs(hspeed + move_sign * walkacc) < walkfract * walkspeed) {
		hspeed += move_sign * walkacc;
	}
	//Se la velocità supererebbe di poco la walkspeed la setta direttamente a walkspeed
	if(abs(hspeed + move_sign * walkacc) < walkfract * walkspeed + walkacc && abs(hspeed) != walkfract * walkspeed) {
		hspeed = move_sign * walkfract * walkspeed;
	}



}
