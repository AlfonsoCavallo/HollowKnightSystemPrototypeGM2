//INIZIALIZZAZIONE DELLE VARIABILI DEL NEMICO
#region //VARIABILI TECNICHE
//Inizializza le variabili tecniche

//DIREZIONE DI MOVIMENTO
move_sign = 0;
//ACCELERAZIONE
walkacc = 0.1; //**attualmente non in uso
//VELOCITA' MASSIMA ORIZZONTALE
walkspeed = 10;
//VELOCITA' MASSIMA VERTICALE
fallspeed = 25;
//QUANTA VELOCITA' MASSIMA SI CALCOLA IN BASE ALL'ANALOGICO O ALTRO
walkfract = 1; //**attualmente non in uso
//ATTRITO
frict = 4; //**attualmente in uso solo per questo valore
//VELOCITA' MASSIMA DI SALTO
jumpspeed = 22;
//INFLUENZA DELLA GRAVITA'
grav_acc = 1;

#endregion
#region //VARIABILI DI CONTROLLO SUGLI STATI
//Inizializza le variabili sugli stati

//Se è a terra = true
grounded = true;
//Se può muoversi = true (horizontal and vertical)
canmoveh = true;
canmovev = true;
//Se sta saltando = true
jumping = false;
//Se è morto = true
dead = false;
//Se stuanneto = true
stunned = false;
#endregion
#region //VARIABILI DI GIOCO
//Inizializza le variabili di gioco

//VITA
life = 3;
//GAMEOVER
game_over = false;
#endregion
#region //VARIABILI DELLA AI

//STATUS
//1- allerta
//2- attaccando
//3- riposo
aggro_status = 1;
//DIREZIONE DELL'ATTACCO
aggro_dir = 0;

#endregion