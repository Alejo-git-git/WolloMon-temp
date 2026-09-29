import wollok.game.*
import pokemon.*

class Player inherits Entrenador {
    var property position = new Position(x=10, y=10)
    var property image = "playerfront.png" 
    const bolsa = []

    method bolsa()=bolsa

    method agregarPokemon(poke){
        bolsa.add(poke)
    }
    

    method moverConColisionDer(nuevaposicion, muros){

        if (!self.haycolision(nuevaposicion, muros)){
            position = position.right(1)
            image = "playersideright.png"
        }

    }
    method moverConColisionIzq(nuevaposicion, muros){

        if (!self.haycolision(nuevaposicion, muros)){
            position = position.left(1)
            image = "playersideleft.png"
        }

    }
    method moverConColisionArriba(nuevaposicion, muros){

        if (!self.haycolision(nuevaposicion, muros)){
            position = position.up(1)
            image = "playerback.png"
        }

    }
    method moverConColisionAbajo(nuevaposicion, muros){

        if (!self.haycolision(nuevaposicion, muros)){
            position = position.down(1)
            image = "playerfront.png"
        }

    }

    method haycolision(posicion, muro){
        return muro.any{m => m.position() == posicion}
    }

    

}

class Muro{
    var property position
    var property image = "transparente.png"
}

class Oak inherits Entrenador{
    var property position = new Position(x=15, y=6)
    var property image = "oak.png"
}




// el jugador es entrenador, los demas personajes para combatir tambien son entrenadores, pero el jugador tiene cosas particulares porque es el mas particular de todos
// entonces podria hacer que, como jugador es lo mismo que entrenador pero con mas cosas, que entrenador sea superclase y jugador herede de entrenador
// posible idea a consultar, hacer que la clase muro tenga subclases como casa o lago, donde al interactuar con una u otra pasan ciertas cosas, al interacturar con casa, nada nuevo,
// al interctuar con lago, le da la oportunidad de batallar con un pokemon de agua al "pescarlo"

class Entrenador{

}