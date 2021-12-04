/// @description Funções e Variaveis
TrocarArma = function(){	
	if(place_meeting(x , y, objPlayer)){
		objPlayer.arma = 2;
		objPlayer.metralhadouraAtiva = true;
		instance_destroy();
		
	}	
}

TrocarArma();