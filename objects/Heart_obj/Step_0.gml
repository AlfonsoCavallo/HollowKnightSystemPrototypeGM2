//Si autodistrugge se la vita supera l'indice del cuore +1 e diminuisce l'indice

if(heart_number > Pg_obj.life) {
	Pg_obj.generated_hearts--;
	instance_destroy();
}