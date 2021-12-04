/// @description Controlador
audio_play_sound(sndPrimeiraFase, 11, true);
numeroInimigos = 0;
pedindoAjuda = false
tempoAjuda = 300;
level = 1;
proximoLevel = 100;
bossGerado = false;
pontos = 0;

global.AdicionarInimigos = function(){
	numeroInimigos++;
}

global.SubtrairInimigos = function(){
	numeroInimigos--;
}

global.HelpBoss = function(){	
	pedindoAjuda = true;
}

global.AdicionaPontos = function(){
	pontos += 1 * level;	
}

BarraDeVida = function(){
	var escala = 4;
	draw_sprite_ext(sprFundoBarra, 1, 9, 25, escala, escala, 0, c_white, 1);
	draw_sprite_ext(sprMarcador, 1, 11, 25, (objPlayer.vidaPlayer / objPlayer.vidaMaximaPlayer) * escala, escala, 0, c_white, 1);
	draw_sprite_ext(sprBarraVida, 1, 9, 25, escala, escala, 0, c_white, 1);
}

sobeLevel = function(){
	if(pontos > proximoLevel){
		proximoLevel *= 2;
		level++;
	}
}

MarcadorPontos = function(){	
	draw_text(1200, 20, pontos);
	draw_text(1200, 40, level);
}

CriarPlayer = function(){
	var posicaoX = random(room_width - 50);
	var posicaoY = random(room_height - 50);
	instance_create_layer(posicaoX, posicaoY, "Player", objPlayer);
}

criarInimigosSimples = function(){
	var posicaoX = random_range(100, 1300);
	var posicaoY = random_range(100, 1300);
	
	if(level >= 7 && !bossGerado){
		instance_create_layer(posicaoX, posicaoY, "Inimigos", objBoss);		
		bossGerado = true;		
	}	
	
	if(numeroInimigos < 25 && !bossGerado){
		if(level < 7){
			numeroInimigos++;
			instance_create_layer(posicaoX, posicaoY, "Inimigos", objPrimeiroInimigo);
		}
	}	

}

CancelaAjuda = function(){
	if(pedindoAjuda == true){
		tempoAjuda--;		
		if(tempoAjuda < 0){
			show_debug_message("Suspende deu Boa");
			tempoAjuda = 300;
			pedindoAjuda = false;
		}	
	}
}