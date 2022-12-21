function diagonal_collider_scr() {
	//NOTE: controlla che l'oggetto non impatti contro un angolo e se lo fa, risolve il problema portandolo
	//nel punto più vicino possibile ad esso. Sopra o sotto dipende da quanto è inclinato il moto del pg

	//Controlla se gli altri collisori lungo gli assi non hanno trovato collisioni
	//Controlla quale delle due componenti della velocità è maggiore per poi muovere con un ciclo
	//la posizione dell'oggetto il più vicino possibile all'angolo lungo una traiettoria fedele
	//a quella che percorrerebbe normalmente. Completato lo spostamento verifica se l'oggetto è sopra
	//l'angolo, e se non lo è significa che la sua velocità orizzontale non va azzerata perchè l'oggetto
	//deve continuare a cadere con la stessa velocità. In ogni caso la velocità orizzontale e le variabili
	//del pg saranno gestite dagli altri collider

	if(!place_meeting(x + hspeed, y, Cube_obj) && !place_meeting(x, y + vspeed, Cube_obj) && place_meeting(x + hspeed,y + vspeed, Cube_obj)){
	
		if(abs(hspeed) >= abs(vspeed)) {
			while(!place_meeting(x + hspeed / abs(vspeed), y + sign(vspeed), Cube_obj)) {
				x += hspeed / abs(vspeed);
				y += sign(vspeed);
			}
			hspeed = 0;
			if(place_meeting(x, y + sign(vspeed), Cube_obj)) {
				vspeed = 0;
			}
		}
		else if(abs(hspeed) < abs(vspeed)) {
			while(!place_meeting(x + sign(hspeed), y + vspeed / abs(hspeed), Cube_obj)) {
				x += sign(hspeed);
				y += vspeed / abs(hspeed);
			}
			hspeed = 0;
			if(place_meeting(x, y + sign(vspeed), Cube_obj)) {
				vspeed = 0;
			}
		}
	}


}
