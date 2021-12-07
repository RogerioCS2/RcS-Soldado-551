/// @description Funções e Variaveis
tempo = 1;
inimigos = [objPrimeiroInimigo, objSegundoInimigo, objSangueJorrando];

MovimentoBola = function(){	
	direction = point_direction(x, y, objPlayer.x, objPlayer.y);	
	image_angle = point_direction(x,y, objPlayer.x, objPlayer.y);
	speed = 15;
}

DestuindoBola = function(valorx, valory){
	//direction = point_direction(x, y, objBoss.x, objBoss.y);
	var numero = random_range(0,3);
	tempo--;
	if(tempo < 0){
		instance_destroy();	
		if(x < 922 && y < 922){
			instance_create_layer(x + 40 * valorx, y + 40 * valory, "Inimigos", inimigos[numero]);
		}else{
			instance_create_layer(x +  40 * valorx, y + 40 *valory, "Inimigos", inimigos[numero]);			
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