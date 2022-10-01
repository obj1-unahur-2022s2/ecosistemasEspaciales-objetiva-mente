import reservaNatural.*

class EspecieFauna {
	const property pesoReferencia
	const property coeficiente
	const property formaDeLocomocion
// agregar las propiedades necesarias
}

class EspecieFlora {
	var property alturaDeReferencia
}

class Animal {
	var property peso
	const property especie
	var sufrioIncendio=false
	
	method biomasa() {return peso ** 2 / self.especie().coeficiente()}
	method esGrande(){return peso > self.especie().pesoReferencia() * 2}
	method esPequenio(){return peso < self.especie().pesoReferencia() / 2}
	method esMediano(){return not(self.esGrande() || self.esPequenio())}
	method sufrirIncendio(unHabitat){
		sufrioIncendio=true
		if (not self.estaVivo())
		{unHabitat.quitarSerVivo(self)}
		else { peso = peso * 0.9}		
	}
	method estaVivo(){return
		if (sufrioIncendio)
		self.especie().formaDeLocomocion().seSalva(self)
		else true		
	}
	
}

class Planta {
	var property altura
	const property especie
	
	method biomasa() { return  self.especie().alturaDeReferencia().min(2 * altura)}
	method esGrande(){ return altura> 10} 
	method esPequenio(){return altura <=10}
	method esMediano(){return false}	
	method sufrirIncendio(unHabitat){
		if (self.esPequenio()) {unHabitat.quitarSerVivo(self)}
		else {altura -= 5}
	}
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(animal) = true}
object correr {method seSalva (animal) = animal.esMediano()}
object quieto {method seSalva(animal) = false}