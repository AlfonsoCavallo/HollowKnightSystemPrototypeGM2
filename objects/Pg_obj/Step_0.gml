//COMANDI DI CONTROLLO DEL MOVIMENTO
#region //CONTROLLORE DI PRESSIONE DEI TASTI
//**Il sistema azzera la velocità se i due tasti di movimento
//orizzontale sono premuti contemporaneamente, il che è scomodo per
//la tastiera dove si vorrebbe che fosse solo l'ultimo premuto a funzionare.

	#region //MOVIMENTO ORIZZONTALE

//Movimento a destra
move_right = gamepad_axis_value(4, gp_axislh)>=0.3 || keyboard_check(ord("D"));
//Movimento a sinistra
move_left = gamepad_axis_value(4, gp_axislh)<=-0.3 || keyboard_check(ord("A"));
//Pressione di un tasto qualsiasi
move_keypressed = keyboard_check(ord("D"))||keyboard_check(ord("A"));

#endregion
	#region //SALTO E SALTO IN VOLO
//Salto

if((gamepad_button_check(4, gp_face1) || keyboard_check(ord("W"))) && jumpisreleased){
	jump = true;
	jumpisreleased = false;
}
else {
	jump = false;
}
//Rilascio salto
if(!jumpisreleased && (gamepad_button_check_released(4, gp_face1) || keyboard_check_released(ord("W")))){
	jumpisreleased = true;
}

#endregion
	#region //DASH
//Dash
if((keyboard_check(vk_shift) || gamepad_button_check(4, gp_shoulderrb)) && dashisreleased) {
	dash = true;	
	dashisreleased = false;
}
else {
	dash = false;	
}
//Rilascio dash
if(!dashisreleased && (gamepad_button_check_released(4, gp_shoulderrb) || keyboard_check_released(vk_shift))){
	dashisreleased = true;
}

#endregion

#endregion
#region //DIREZIONE DI MOVIMENTO

//Implementa move_sign che segna la direzione di movimento con '-1', '1' o '0' (sinistra, destra e fermo)
move_sign = move_right - move_left;
//Imposta la direzione guardata come l'ultima direzione verso cui ci si è mossi
if(move_sign != 0) {
	directionh = move_sign;	
}

#endregion

//FUNZIONI DI MOVIMENTO
#region //TIPOLOGIA DI MOVIMENTO
//Se il pg si può muovere ed ha un attrito col suolo abbastanza alto usa lo script di movimento numero 2

if((frict >= 1 || !grounded) && !stunned && canmoveh) {
	horizontal_movement2_scr();
}
//altrimenti usa lo script di movimento numero 1

if((canmoveh && grounded && frict < 1) && !stunned) {
	horizontal_movement_scr();
}

#endregion
#region //SALTO DOPPIOSALTO E WALLJUMP
//Se il personaggio può muoversi verticalmente, non è stordito e non è aggrappato
//ad un muro, allora la funzione di salto può eventualmente influenzare il suo moto verso l'alto

if(canmovev && !stunned && !walled) {
	airjump_scr(); //**Occorre che sia posto prima di jump affinchè venga eseguito correttamente
	jump_scr();
}
if(canmovev && !stunned && walled) {
		walljump_scr();
}

#endregion
#region //DASH
//Se il personaggio può muoversi orizzontalmente e non è stunnato, la funzione dash
//può influenzare il suo moto

if(canmoveh && !stunned) {
	dash_scr();
}
//Se il cooldown del dash è esaurito ed il pg è a terra, può dashare di nuovo
if(alarm[3] <= 0 && grounded) {
	candash = true;	
}

#endregion

//DEBUG
#region //COMANDI PER AUMENTARE O RIDURRE LA VITA

//Premere K rimuove una vita
if(keyboard_check_released(ord("K"))) {
	life--;
}
//Premere L per aumentarla
if(keyboard_check_released(ord("L"))) {
	life++;
}

#endregion

//CONTROLLO DEI PARAMETRI DI GIOCO
#region //GENERATORE DI CUORI
//Finchè la quantità di cuori generati è inferiore alla vita del personaggio,
//genera altri cuori

if(generated_hearts < life) {
	while(generated_hearts < life) {
		heart_generate();
	}
}

#endregion
#region //GAMEOVER

//Se la vita del personaggio scende a 0 attiva il gameover
if(life == 0 && alarm[1] <= 0) {
	alarm[1] = 0.5 * room_speed;
}

#endregion

//INTERAZIONI AMBIENTALI (il controllo delle collisioni deve sempre essere l'ultimo)
#region //GRAVITA'
/**
Se la velocità di caduta non ha ancora raggiunto il suo limite, e il pg non è
attaccato al muro oppure ha ancora un moto ascensionale, e non sta dashando la caduta è ancora
affetta dall'accelerazione di gravità. 
**/
if(vspeed < fallspeed && (!walled || vspeed < 0) && !dashing) {
	gravity_scr();
}

//Se l'oggetto è aggrappato ad un muro e sta scendendo allora deve essere rallentato
if(walled && vspeed >= 0 && !dashing) {
	wallfrict_scr();	
}

#endregion
#region //CONTROLLO DELLE COLLISIONI
//**Valutare la possibilità di accorpare i tre controllori direzionali, in unasola funzione di controllo

//Controllore delle collisione diagonali
diagonal_collider_scr();
//Controllore delle collisioni verticali
vertical_collider_scr();
//Controllore delle collisioni orizzontali
horizontal_collider_scr();

#endregion

//GRAFICA
#region //GRAFICA

#region //GRAFICA DELL'OGGETTO

if(walled) {
	sprite_index = PgWalled_spr;
}
else if(dashing) {
	sprite_index = PgDashing_spr;	
}
else if(jumping) {
	sprite_index = PgJumping_spr;	
}
else if(move_sign != 0) {
	sprite_index = PgWalking_spr;	
}
else {
	sprite_index = Pg_spr;	
}

#endregion
#region //DIREZIONE DELLA GRAFICA
//DIREZIONA L'IMMAGINE VERSO DOVE GUARDA IL PG
image_xscale = directionh;
#endregion

#endregion