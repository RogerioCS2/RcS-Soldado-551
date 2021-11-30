/// @description Variaveis Funções
event_inherited();
vida = 500;
esperandoTiro = room_speed; 
tempoAjuda = 20;
boss = true;
pedindoAjuda = false;

AtirandoInimigos = function(){
	esperandoTiro--;	
	if(esperandoTiro <= 0 && objGameController.numeroInimigos < 15){
		esperandoTiro = room_speed;
		instance_create_layer(x, y, layer, objBolaPrimeiroInimigo);		
	}	
}

HelpBoss = function(){
	if(place_meeting(x, y, objMunicaoPistola)){
		pedindoAjuda = true;
		tempoAjuda--;
		if(pedindoAjuda < 0){
			pedindoAjuda = false;
		}		
	}
}
