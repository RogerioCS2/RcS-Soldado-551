/// @description Funções e Variaveis
atirar = false;
tempoTiro = 0;
velocidade = 5;
apanhando = false;
tempoDano = room_speed / 4;
vidaPlayer = 100;
arma = 2;

LimitesTela = function(){
	x = clamp(x, 0 + sprite_width / 2, room_width - sprite_width / 2);
	y = clamp(y, 0 + sprite_height / 2, room_height - sprite_height / 2);	
}

MovimentoPlayer = function(){
	image_angle = point_direction(x,y, objMira.x, objMira.y);
	
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);
	
	movimentoHorizontal= (direita - esquerda) * velocidade;
	movimentoVertical = (baixo - cima) * velocidade;
	
	x += movimentoHorizontal;
	y += movimentoVertical;	
}

TiroPlayer = function(){
	tempoTiro--;
	atirar = mouse_check_button(mb_left);
	if(atirar && tempoTiro < 0){
		if(arma == 1){tempoTiro = 13;}
		if(arma == 2){tempoTiro = 5;}	
		if(arma == 3){tempoTiro = 2;}
		instance_create_layer(x + 4, y, layer, objMunicaoPistola) 
	}	
}

LevandoDano = function(){
	if(place_meeting(x, y, objBolaPrimeiroInimigo)){apanhando = true;}	
	if(place_meeting(x, y, objInimigoPai)){apanhando = true;}	
	
	if(apanhando){		
		image_blend = c_red;
		tempoDano--;	
		if(tempoDano <= 0){
			if(vidaPlayer > 0){
				vidaPlayer--;
			}	
			apanhando = false;
			tempoDano = room_speed / 4;
			image_blend = c_white;
		}
	}
	if(vidaPlayer <= 0){
		game_restart();
	}
}

MarcandoVidaPlayer = function(){
	draw_text(20, 40, vidaPlayer);
}
