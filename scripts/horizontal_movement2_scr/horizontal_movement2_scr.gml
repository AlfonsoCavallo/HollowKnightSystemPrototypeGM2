function horizontal_movement2_scr() {
	//NOTE: Verifica che l'analogico non sia inclinato meno di un certo valore e porta la velocità 
	//del pg, gradualmente con il movimento del analogico al massimo.
	//Se un tasto è premuto da tastiera il personaggio va subito al massimo

	if(!move_keypressed && abs(gamepad_axis_value(4, gp_axislh)) > 0.3) {
		hspeed = gamepad_axis_value(4, gp_axislh) * walkspeed;
	}
	else {
		hspeed = move_sign * walkspeed;
	}


}
