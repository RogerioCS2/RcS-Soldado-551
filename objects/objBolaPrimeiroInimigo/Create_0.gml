/// @description Funções e Variaveis
tempo = 1;

MovimentoBola = function(){	
	direction = point_direction(x, y, objPlayer.x, objPlayer.y);	
	image_angle = point_direction(x,y, objPlayer.x, objPlayer.y);
	speed = 15;
}

DestuindoBola = function(){
	//direction = point_direction(x, y, objBoss.x, objBoss.y);
	tempo--;
	if(tempo < 0){
		instance_destroy();	
		if(x < 1000 && y < 1000){
			instance_create_layer(x + 20, y +20, "Inimigos", objPrimeiroInimigo);
		}else{
			instance_create_layer(x - 20, y -20, "Inimigos", objPrimeiroInimigo);			
		}
	
		if(objGameController.numeroInimigos < 25){
			global.AdicionarInimigos();
		}		
	}	
	
	if(place_meeting(x, y, objMunicaoPistola)){
		instance_create_layer(x, y, "Player", objExplosaoInimigo);
		instance_destroy();
	}
}

MovimentoBola();