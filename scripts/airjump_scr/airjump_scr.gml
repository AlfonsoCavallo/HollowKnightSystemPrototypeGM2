function airjump_scr() {
	//NOTE: fa effettuare un secondo salto a mezz'aria al PG

	//Verifica che il pg stia saltando, e se è verificato, controlla che i comandi siano stati correttamente
	//eseguiti e aziona il secondo salto

	if(jump && jumping && !airjumping && !dashing) {
		vspeed = - jumpSpeedFraction * jumpspeed;
		airjumping = true;
	}


}
