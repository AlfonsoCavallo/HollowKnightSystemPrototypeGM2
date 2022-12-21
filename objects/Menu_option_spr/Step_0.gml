//CONTROLLA CHE IL TASTO DI APERTURA DEL MENU' SIA PREMUTO
if(keyboard_check(vk_escape) || gamepad_button_check(4, gp_start)) {
	openMenu = true;
}
else {
	openMenu = false;	
}

//SE IL SEGNALE DI APERTURA DEL MENU' E' ATTIVO, VA ALLA SCHERMATA DEL MENU'
//Se il segnale di apertura del menu' è attivo, rende la stanza persistente, e va alla stanza del menu
if(openMenu) {
	room_persistent = true;
	room_goto(Menu_room);
}
else {
	room_persistent = false;	
}

