function jump_scr() {
	//NOTE: fa esercitare un salto al pg

	//Verifica se il pg è a terra e non sta già saltando (nella maggior parte dei casi è la stessa cosa). Se
	//il comando "jump" è alto, dà una spinta verso l'alto al personaggio. Abbassa la variabile "grounded" e alza
	//"jumping"
	if(grounded && jump && !jumping && !dashing) {
		vspeed -= jumpspeed;
		grounded = false;
		jumping = true;
	}


}
