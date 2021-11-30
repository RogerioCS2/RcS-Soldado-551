/// @description Funções e Variaveis
atirar = false;
tempoTiro = 0;
velocidade = 5;
apanhando = false;
tempoDano = room_speed / 4;

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
		tempoTiro = 13;
		instance_create_layer(x + 4, y, layer, objMunicaoPistola) 
	}	
}
