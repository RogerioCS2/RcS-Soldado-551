/// @description Funções Variaveis
seguirPlayer = false;
distancia = 0;
vida = 5;
boss = false;
apanhando = false;
inimigoDestruido = false;

DestroindoLimites = function(){		
	if(place_meeting(x, y, objInimigoPai) && !boss){
		inimigoDestruido = true;
		instance_destroy();
	}
	if(place_meeting(x, y, objBolaPrimeiroInimigo) && !boss){
		inimigoDestruido = true;
		audio_play_sound(sndSomGosma, 10, false);
		instance_create_layer(x, y, layer, objExplosaoInimigo);
		instance_destroy();
	}
	if(y > 1696){instance_destroy(); inimigoDestruido = true;}
	if(y < 160){instance_destroy();  inimigoDestruido = true;}
	if(x > 1696){instance_destroy(); inimigoDestruido = true;}
	if(x < 160){instance_destroy(); inimigoDestruido = true;}
	if(place_meeting(x, y, objBoss)){instance_destroy(); inimigoDestruido = true;}
	if(inimigoDestruido){
		global.SubtrairInimigos();	
	}
}

partiuBriga = function(){
	direction = point_direction(x, y, objPlayer.x, objPlayer.y);
	image_angle = point_direction(x,y, objPlayer.x, objPlayer.y);
}

DanoInimigo = function(vel){
	partiuBriga();
	vida--;
	if(vida <= 0){
		global.AdicionaPontos();
		global.SubtrairInimigos();		
		instance_create_layer(x, y, layer, objExplosaoInimigo);
		audio_play_sound(sndSomGosma, 10, false);
		instance_create_layer(x, y, layer, objTremeTela);		
		instance_destroy();		
		objGameController.totalInimigos++;
	}
	speed = vel;
}

MovimentoInimigos = function(vel){
	image_angle = point_direction(x,y, objPlayer.x, objPlayer.y);
	distancia = distance_to_object(objPlayer);	
	if(objGameController.level < 3){
		if(distancia < 200){ seguirPlayer = true;}
		if(seguirPlayer){
			partiuBriga();			
		}
	}else{
		partiuBriga();
	}
	speed = vel;	
}

bossPedindoAjuda = function(){
	if(objGameController.pedindoAjuda == true && boss = false){
		show_debug_message("Atacar");
		partiuBriga();
		speed = 2;		
	}
	if(objGameController.pedindoAjuda == false && boss = false){		
		speed = 1;
	}
}
