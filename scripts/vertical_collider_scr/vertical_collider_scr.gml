function vertical_collider_scr() {
	//NOTE: La funzione impedisce che le hitbox si sovrappongano vericalmente

	//Controlla se continuando con questa velocità l'oggetti si compenetrerebbe ad un muro. In questo caso
	//sposta la sua y lentamente verso la direzione di movimento fino al pixel immediatamente precedente all'impatto,
	//poi ne azzera la velocità.
	//Una volta fatto controlla se il muro è sotto il personaggio. Se è verificato significa che il pg è atterrato e
	//quindi abbassa la variabile "jumping", "airjumping", walled e alza il valore della variabile "grounded".

	if(place_meeting(x, y + vspeed, Cube_obj)) {
		while(!place_meeting(x, y + 1 * sign(vspeed), Cube_obj)) {
			y += sign(vspeed) * 1;
		}
		if(place_meeting(x, y + 1, Cube_obj)) {
		grounded = true;
		walled = false;
		jumping = false;
		airjumping = false;
		}
		vspeed = 0;
	}

	//Se l'oggetto non ha nulla sotto i piedi, non è a terra ed è considerato in salto

	if(!place_meeting(x, y + 1, Cube_obj)) {
		jumping = true;
		grounded = false;	
	}


}
