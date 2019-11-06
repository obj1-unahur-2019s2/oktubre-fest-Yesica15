class Persona{
	var property peso
	var property jarras
	var property fanMusicaTradicional
	var property nivelAguante
	
	method estaEbria() = peso* self.alcoholIngerido() >= nivelAguante
	
	method alcoholIngerido() = jarras.sum({jarra => jarra.litros()})
	
	method marcasAgradables(marca) = false
}

class Belgas inherits Persona{
	
	override method marcasAgradables(marca) = marca.contLuposo()> 4
}

class Aleman inherits Persona{
	
	override method marcasAgradables(marca) = true
}

class Checo inherits Persona{
	
	override method marcasAgradables(marca) = marca.graduacion() > 8
}
