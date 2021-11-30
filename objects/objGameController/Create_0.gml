/// @description Controlador
audio_play_sound(sndPrimeiraFase, 11, true);
numeroInimigos = 0;

global.AdicionarInimigos = function(){
	numeroInimigos++;
}

global.SubtrairInimigos = function(){
	numeroInimigos--;
}

MarcadorInimigos = function(){	
	draw_text(20, 20, numeroInimigos);	
}
