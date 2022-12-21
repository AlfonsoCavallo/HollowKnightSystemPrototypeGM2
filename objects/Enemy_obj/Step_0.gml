//AI
#region//COMPORTAMENTO DELLA AI

//RESETTA L'AGGRO SE STUNNATO
if(stunned) {
	alarm[0] = -1;
	aggro_status = 1;
}

//FUNZIONE CHE REGOLA LE AZIONI DELL'OGGETTO
enemy_action_scr();

#endregion

//INTERAZIONI AMBIENTALI (Controllo delle collisioni per ultimo)
#region //ATTRITO
//Se è a terra e non sta attaccando, riduce la sua velocità con una decelerazione costante
//**attualmente l'attrito è una costante (0.3), occorrerà utilizzare la variabile frict

if(grounded && aggro_status != 2) {
	if(sign(hspeed - 0.3 * sign(hspeed)) == sign(hspeed)) {
		hspeed -= 0.3 * sign(hspeed);
	}
	else if	(hspeed != 0) {
		hspeed = 0;
	}
}

#endregion
#region //GRAVITA'
//Se la velocità di caduta non ha ancora raggiunto il suo limite, la caduta è ancora
//affetta dall'accelerazione di gravità

if(vspeed < fallspeed) {
	gravity_scr();
}

#endregion
#region //CONTROLLO DELLE COLLISIONI
//**Valutare la possibilità di accorpare i tre controllori direzionali, in una
//sola funzione di controllo

//Controllore delle collisione diagonali
diagonal_collider_scr();
//Controllore delle collisioni verticali
vertical_collider_scr();
//Controllore delle collisioni orizzontali
horizontal_collider_scr();

#endregion