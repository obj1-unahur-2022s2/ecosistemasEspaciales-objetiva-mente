import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitat(unHabitat){
		habitats.add(unHabitat)
	}
	method quitarHabitat(unHabitat){
		habitats.remove(unHabitat)
	}
	method habitatConMayorBiomasa(){return
		habitats.max({h=> h.biomasaTotal()})	
	}
	method cantidadTotalDeBiomasa(){return
		habitats.sum({h=> h.biomasaTotal()})
	}
	method habitatsDesequilibrados(){return
		habitats.filter({h=>not (h.estaEnEquilibrio())})		
	}
	method estaEnTodosLosHabitats(unaEspecie){return
		habitats.all({h=>h.estaEnElHabitat(unaEspecie)})
	}	
}

class Habitat {
	const property seresVivos = []
	
	
	method agregarSerVivo(unSer){
		seresVivos.add(unSer)
	}
	method quitarSerVivo(unSer){
		seresVivos.remove(unSer)
	}
	method biomasaTotal(){return
		seresVivos.sum({s=>s.biomasa()})
	}
	method estaEnEquilibrio(){return
		(self.totalEjemplaresGrandes() < 
		 self.totalEjemplaresPequenios() / 3) &&
		 self.totalEjemplaresMedianos()>= 1
		
	}
	method totalEjemplaresGrandes(){return
		seresVivos.count({s=>s.esGrande()})
	}
	method totalEjemplaresPequenios(){return
		seresVivos.count({s=>s.esPequenio()})
	}
	method totalEjemplaresMedianos(){return
		seresVivos.count({s=>s.esMediano()})
	}
	method estaEnElHabitat(unaEspecie){ return
		seresVivos.any({s=>s.especie() == unaEspecie})
	}
	method producirIncendio(){
		seresVivos.forEach({s=>s.sufrirIncendio(self)})
	}
	
}