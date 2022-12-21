//INIZIALIZZAZIONE DELLE VARIABILI DEL PERSONAGGIO
#region //VARIABILI SUI TASTI
//Inizializza le variabili relative ai tasti

	#region //TASTI MOVIMENTO

//COMANDO DI MOVIMENTO A SINISTRA
move_left = false;
//COMANDO DI MOVIMENTO A DESTRA
move_right = false;
//COMANDO DI MOVIMENTO ORIZZONTALE PREMUTO
move_keypressed = false;

#endregion
	#region //TASTI DI SALTO

//COMANDO DI SALTO O SALTO IN ARIA
jump = false;
//PULSANTE SALTO RILASCIATO
jumpisreleased = true;

#endregion
	#region //TASTI DI DASH

//COMANDO DI DASH
dash = false;
//PULSANTE DI DASH RILASCIATO
dashisreleased = true;

#endregion

#endregion
#region //VARIABILI TECNICHE
//Inizializza le variabili tecniche
	
	#region //PARAMETRI DI MOVIMENTO

//DIREZIONE DI MOVIMENTO
move_sign = 0;
//DIREZIONE GUARDATA
directionh = 1;
//ACCELERAZIONE
walkacc = 0.1; //**attualmente non in uso
//VELOCITA' MASSIMA ORIZZONTALE
walkspeed = 10;
//QUANTA VELOCITA' MASSIMA SI CALCOLA IN BASE ALL'ANALOGICO O ALTRO
walkfract = 1; //**attualmente non in uso
//ATTRITO
frict = 4; //**attualmente in uso solo per questo valore

#endregion
	#region //PARAMETRI DI SALTO

//VELOCITA' MASSIMA DI SALTO
jumpspeed = 22;
//RIPRESA DAL SALTO DAL MURO IN SECONDI
walljump_cooldown = 0.2;
//FRAZIONE DELLA VELOCITA' DI SALTO UTILIZZATA PER IL DOPPIO SALTO
jumpSpeedFraction = 0.85;


#endregion
	#region //PARAMETRI DI GRAVITA'

//INFLUENZA DELLA GRAVITA'
grav_acc = 1;
//VELOCITA' MASSIMA VERTICALE
fallspeed = 25;
//VELOCITA' CON ATTRITO AL MURO
frictwall_speed = 10;

#endregion
	#region //PARAMETRI DI DASHING

//TEMPO DI RICARICA DEL DASH IN SECONDI
dash_cooldown = 0.5;
//DURATA DEL DASH IN SECONDI
dash_time = 0.25;
//VELOCITA' DEL DASH
dash_speed = 25;

#endregion

#endregion
#region //VARIABILI DI CONTROLLO SUGLI STATI
//Inizializza le variabili sugli stati

	#region //STATI DI MOBILITA'

//Se è a terra = true
grounded = false;
//Se è aggrappato ad un muro = true;
walled = false;
//Se può muoversi = true (horizontal and vertical)
canmoveh = true;
canmovev = true;
//Se stunnato = true
stunned = false;

#endregion
	#region //STATI DI SALTO

//Se sta saltando = true
jumping = true;
//Se sta eseguendo un doppio salto = true
airjumping = true;

#endregion
	#region //STATI DI DASHING

//Se sta dashando = true
dashing = false;
//Se il personaggio può dashare = true
candash = true;

#endregion
	#region //STATI DI GIOCO

//Se è morto = true
dead = false;
//Se è invincibile = true
invincible = false;

#endregion

#endregion
#region //VARIABILI DI GIOCO
//Inizializza le variabili di gioco

//VITA
life = 3;
//GAMEOVER
game_over = false;

#endregion
#region //ALTRI PARAMETRI TECNICI

//INIZIALIZZAZIONE VITE E ALTRI PARAMETRI
generated_hearts = 0;

#endregion

