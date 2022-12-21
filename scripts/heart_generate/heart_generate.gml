function heart_generate() {
	//Genera un cuore
	generated_hearts++;
	heart_array[generated_hearts - 1] = instance_create_layer(32 + 64 * (generated_hearts - 1), 32, "Instances", Heart_obj);
	with(heart_array[generated_hearts-1]) {
		heart_number = Pg_obj.generated_hearts;	
	}


}
