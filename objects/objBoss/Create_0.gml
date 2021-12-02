/// @description Variaveis Funções
event_inherited();
vida = 500;
esperandoTiro = room_speed; 
boss = true;
pedindoAjuda = false;

AtirandoInimigos = function(){
	esperandoTiro--;	
	if(esperandoTiro <= 0 && objGameController.numeroInimigos < 15){
		if(vida < 300){
			esperandoTiro = room_speed / 2;
			image_blend = c_red;
		}else{
			esperandoTiro = room_speed;
		}	
		instance_create_layer(x, y, layer, objBolaPrimeiroInimigo);		
	}	
}


