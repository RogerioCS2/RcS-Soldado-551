/// @description Update
CancelaAjuda();
criarInimigosSimples();
sobeLevel();

if(bossDetruido){
	tempoFinal--;
	if(tempoFinal < 0){
		show_debug_message(tempoFinal);
		room_goto(Agradecimentos);
	}		
}
