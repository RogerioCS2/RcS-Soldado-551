/// @description Funções e Variaveis
cursor = 0;
registrosMenu = 0
menu = ["REINICIAR PARTIDA", "SAIR DO JOGO AGORA"];
botaoEnter = 0;

DesenharMenu = function(){
	draw_set_font(fntJogo);
	registrosMenu = array_length(menu);	
	for(var i = 0; i < registrosMenu; i++){
		var cor = c_white;
		var opcaoMenu = menu[i];
		if(cursor == i){
			cor = c_lime;				
		}
		draw_text_color(540, (room_height / 2) + i * 30, opcaoMenu, cor, cor,cor, cor, 1);
	}
	draw_set_font(-1);
}

SelecionandoOpcoes = function(){
	var cima, baixo, frente, traz;
	
	cima = keyboard_check_pressed(vk_up); 
	baixo = keyboard_check_pressed(vk_down);
	frente = keyboard_check_pressed(vk_right);
	traz = keyboard_check_pressed(vk_left);
	
	if(cima || baixo){
		var tamanhoVetor = array_length(menu) - 1;
		cursor += baixo - cima;
		cursor = clamp(cursor, 0 , tamanhoVetor);
	}
}

ReiniciarJogo = function(){
	botaoEnter = keyboard_check(vk_enter);
	if(cursor == 0 && botaoEnter){
		game_restart();
	}	
}

FimJogo = function(){
	botaoEnter =  keyboard_check(vk_enter);
	if(cursor == 1 && botaoEnter){
		game_end();
	}
}


