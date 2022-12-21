function pg_friction_scr() {
	//NOTE: Questa funzione implementa un rallentamento se il pg si sta muovendo ma non sta premendo tasti di
	//movimento
	//
	//Se il pg non si sta muovendo con un tasto ma è a terra con una certa velocità
	if(move_sign == 0 && abs(hspeed) > 0) {
		if(abs(hspeed) - frict >= 0) {
			hspeed -= sign(hspeed) * frict;
		}
		else {
			hspeed = 0;
		}
	}


}
