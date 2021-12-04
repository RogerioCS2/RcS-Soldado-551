TamanhoCenaRandomico = function(){
	room_width = irandom_range(640, 1344);
	room_width = irandom_range(480, 768);
}
//TamanhoCenaRandomico();


TrocarFundo = function(){
	var planoDeFundo = choose(sprFundoAlternativo1, sprFundoAlternativo2);
	var nomeLayer = layer_background_get_id("Fundo");
	layer_background_change(nomeLayer, planoDeFundo);
}
//TrocarFundo();

