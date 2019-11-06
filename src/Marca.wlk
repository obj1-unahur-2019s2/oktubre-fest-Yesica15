class Marca{
	var property contLupulo
	var property origen
	var property graduacion
	
}

class CervezaBlanca{

}

class CervezaNegra inherits Marca{
	var property graduacionReglamentaria
	
	override method graduacion() = graduacionReglamentaria.min(contLupulo)
	
}

class CervezaRoja inherits CervezaNegra{
	override method graduacion() = super()*1.25
}

class Jarra{
	var property litros
	var property marcas 
	
	method contAlcoho()= litros* marcas.graduacion()
}

