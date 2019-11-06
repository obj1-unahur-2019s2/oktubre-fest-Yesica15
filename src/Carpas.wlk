import Marca.*

class CarpaCervecera{
	const property limitePersonas
	var property tieneBandaTrad = false
	var property marcaVenta
	var property personasDentro = #{}
	
	method puedeIngresar(persona){
		return not persona.estaEbria() and self.noSuperaLimite()
	}
	
	method noSuperaLimite(){
		return personasDentro.size() < limitePersonas
	}
	
	method ingresar(persona){
		if (persona.puedeEntrarCarpa(self) and not self.estaDentro(persona)){
			personasDentro.add(persona)
		}
	}
	
	method estaDentro(persona){
		return personasDentro.any({per => per == persona})
	}
	
	method servirJarra(capacidad, persona){
		if (self.estaDentro(persona)){
			persona.recibirJarra(new Jarra(litros= capacidad, marcas= marcaVenta, carpaOrigen =self))
		}
	}
	
	method cantEbriosEmpedernidos(){
		return personasDentro.map({per => per.esEbrioEmpedernido()}).size()
	}
	
	method bebioAqui(listaLugares){
		return listaLugares.any({lugar => lugar == self})
	}
	
	method personasQueNoConsumieron(){
		return personasDentro.filter({per => not self.bebioAqui(per.carpasDondeAsistio())})
	}
}