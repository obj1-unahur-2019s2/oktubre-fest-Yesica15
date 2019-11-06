import Marca.*
import Carpas.*

class Persona{
	var property peso
	var property jarras
	var property fanMusicaTradicional
	var property nivelAguante
	
	method estaEbria() = peso* self.alcoholIngerido() >= nivelAguante
	
	method alcoholIngerido() = jarras.sum({jarra => jarra.litros()})
	
	method marcasAgradables(marca) = false
	
	method quiereEntrarCarpa(carpa){
		return self.marcasAgradables(carpa.marcaVenta()) and self.cumpleGustoMusica(carpa)
	}
	
	method cumpleGustoMusica(carpa){
		return fanMusicaTradicional == carpa.tieneBandaTrad()
	}
	
	method puedeEntrarCarpa(carpa){
		return self.quiereEntrarCarpa(carpa) and carpa.puedeIngresar(self)
	}
	
	method recibirJarra(jarra){
		jarras.add(jarra)
	}
	
	method esEbrioEmpedernido(){
		return jarras.all({jar => jar.litros() >= 1})
	}
	
	method nacionalidad()
	method esPatriota(){
		return jarras.all({jar => jar.marcas().origen() == self.nacionalidad()})
	}
	
	method marcasDeJarras(){
		return jarras.map({jar => jar.marcas()}).asSet()
	}
	
	method estaEnListaDeMarcas(marcas){
		return self.marcasDeJarras().any({mar => mar == marcas})
	}
	
	method marcasEnComun(listaMar){
		return listaMar.filter({mar => self.estaEnListaDeMarcas(mar)})
	}
	
	method marcasDistintas(listaMar){
		return listaMar.filter({mar => not self.estaEnListaDeMarcas(mar)})
	}
	
	method sonCompatibles(persona){
		return self.marcasEnComun(persona.marcasDeJarras()).size() > self.marcasDistintas(persona.marcasDeJarras()).size()
	}
	
	method carpasDondeAsistio(){
		return jarras.map({jar => jar.carpaOrigen()}).asSet()
	}
}

class Belgas inherits Persona{
	
	override method marcasAgradables(marca) = marca.contLuposo()> 4
	override method nacionalidad() = "Belgica"
}

class Aleman inherits Persona{
	
	override method marcasAgradables(marca) = true
	override method quiereEntrarCarpa(carpa){
		return super(carpa) and carpa.personasDentro() % 2 == 0
	}
	override method nacionalidad() = "Alemania"
}

class Checo inherits Persona{
	
	override method marcasAgradables(marca) = marca.graduacion() > 8
	override method nacionalidad() = "Republica Checa"
}
