function gravity_scr() {
	//NOTE: Verifica se il pg non è a terra e gli applica un'acceleraione verso il basso

	if(!grounded) {
		vspeed += grav_acc;
	}


}
