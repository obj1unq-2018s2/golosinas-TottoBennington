import golosinas.*
object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var saboresDeGolosinas = []
	var golosinas = []
	method comprar(golosina) {
		golosinas.add(golosina)
		// no se si deberia de usar self.golosinas().add(golosina) en lugar de golosinas.add(..)
	}
	method golosinas() = golosinas
	
	method probarGolosinas() {
		golosinas.forEach({
			golosina => golosina.mordisco()
		})
	}
	method desechar(unaGolosina){
		golosinas.remove(unaGolosina)
	}
	method hayGolosinasSinTACC(){
		golosinas.any({
			golosina => golosina.libreGluten()
		})
	}
	method preciosCuidados(){
		golosinas.all({
			golosina => golosina.precio()<=10
		})
	}
	method golosinaDeSabor(unSabor){
		golosinas.findOrElse({
			golosina => golosina.gusto() == unSabor
		},{'No hay golosinas de sabor: ' + unSabor})
	}
	method golosinasDeSabor(unSabor){
		golosinas.filter({
			golosina => golosina.gusto() == unSabor
		})
	}
	method sabores(){
		golosinas.forEach({
			golosina => saboresDeGolosinas += [golosina.gusto()]
		})
		return saboresDeGolosinas.asSet() // asSet() para evitar duplicados
	}
	method golosinaMasCara() = golosinas.max({
		golosina => golosina.precio()
	})
	
	method pesoGolosinas() = golosinas.sum({
		golosina => golosina.peso()
	})
	
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(golosinas.asSet())
	// tuve que usar set (previamente chequeando en la documentacion como usar asSet() y difference())
	// ya que no se me ocurria otra forma asi de facil.
	
	method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(self.sabores())
	// previo al uso de este metodo tenemos que 'comprar' varias golosinas
	// para tener gustos guardados
		
}

