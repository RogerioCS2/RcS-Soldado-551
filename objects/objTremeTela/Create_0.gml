/// @description Funções e Variaveis

tremer = 30;
tempoTremida = 10;

TelaTremendo = function(){
	tempoTremida--; 
	view_xport[0] = random_range(-tremer, tremer);
	view_yport[0] = random_range(-tremer, tremer);
	if(tempoTremida < 0){
		tempoTiro = 30;
		view_xport[0] = 0;
		view_yport[0] = 0;
		instance_destroy();
	}
}