/// @description Controlador
audio_play_sound(sndPrimeiraFase, 11, true);
numeroInimigos = 0;
pedindoAjuda = false
tempoAjuda = 300;
level = 1;
proximoLevel = 100;
bossGerado = false;
pontos = 0;

inimigoSimples[0] = objPrimeiroInimigo;
inimigoSimples[1] = objSegundoInimigo;
inimigoSimples[2] = objSangueNoChao;

global.AdicionarInimigos = function(){
	numeroInimigos++;
}

global.SubtrairInimigos = function(){
	numeroInimigos--;
	if(numeroInimigos < 0){
		game_restart();
	}
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
	draw_set_colour(c_lime);	
	draw_text(765, 20, "Total Inimigos: ");
	draw_text(900, 20, numeroInimigos);
	draw_text(965, 20, "Level: ");	
	draw_text(1020, 20, level);
	draw_text(1050, 20, "Total Pontos: ");
	draw_text(1170, 20, pontos);	
}

CriarPlayer = function(){
	var posicaoX = random(room_width - 50);
	var posicaoY = random(room_height - 50);
	instance_create_layer(posicaoX, posicaoY, "Player", objPlayer);
}

criarInimigosSimples = function(){
	var posicaoX = random_range(100, 1300);
	var posicaoY = random_range(100, 1300);
	var inimigo = random_range(0, 2); 
	
	if(level >= 7 && !bossGerado){
		instance_create_layer(900, 900, "Inimigos", objBoss);		
		bossGerado = true;		
	}	
	
	if(numeroInimigos < 25 && !bossGerado){
		if(level < 7){
			numeroInimigos++;
			instance_create_layer(posicaoX, posicaoY, "Inimigos", inimigoSimples[inimigo]);
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