/// @description Funções e Variaveis

MovimentoTiro = function(){	
	direction = point_direction(x, y, objMira.x, objMira.y);	
	image_angle = point_direction(x, y, objMira.x, objMira.y);
	speed = 10;
}

DestruindoMunicao = function(){
	if(x > room_width + 30 || x < -20){
		instance_destroy();
	}
	if(y > room_height + 30 || y < -20){
		instance_destroy();
	}
}

ColisaoInimigo = function(){
	if(place_meeting(x,y, objInimigoPai)){
		//show_debug_message("Acertei o Maledito");
		instance_create_layer(x,y, "Mira", objSangueJorrando);
		instance_destroy();		
	}
}

MovimentoTiro();