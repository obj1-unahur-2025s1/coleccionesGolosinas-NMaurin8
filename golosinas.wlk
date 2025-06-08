class Golosina{
  var property precio
  var property sabor
  var property peso
  var property libreDeGluten
  

  method mordisco(){
    peso = 0.max(peso-1)
  }
}

object frutilla{
  method siguienteSabor() = chocolate
}
object chocolate{
  method siguienteSabor() = naranja
}
object naranja{
  method siguienteSabor() = frutilla
}
object vainilla{}
object melon{}

class Bombon inherits Golosina(precio = 5, sabor = frutilla, peso = 15, libreDeGluten = true){

  override method mordisco(){
    peso = 0.max( (peso * 0.8) - 1 )
  }

}

class Alfajor inherits Golosina(precio = 12, peso = 300, sabor = chocolate, libreDeGluten = false){
  override method mordisco(){
    peso = peso * 0.8
  }
}

class Caramelo inherits Golosina(precio = 1, peso = 5, sabor = frutilla, libreDeGluten = true){
  
}

class Chupetin inherits Golosina(precio = 2, peso = 7, sabor = naranja, libreDeGluten = true){
  override method mordisco(){
    if (peso >= 2){
      peso -= peso*0.1
    }
  }
}

class Oblea inherits Golosina(precio =5, peso = 250, sabor = vainilla, libreDeGluten = false){
  override method mordisco(){
    if(peso > 70){
      peso = 0.max(peso - (peso * 0.5))
    }else{
      peso = 0.max(peso - (peso * 0.25))
    }
  }
}

class Chocolatin inherits Golosina( precio = 0.50 * peso, sabor = chocolate, libreDeGluten = false){
  
  override method mordisco(){
    peso = 0.max(peso - 2)
  }
}

class GolosinaBaniada inherits Golosina(precio = 0, peso = 0, sabor = frutilla, libreDeGluten = true) {
  var property golosinaDeBase
  var pesoBaniado = 4
  var cantidadDeMordiscos = 0

  method initialize(unaGolosina) {
    golosinaDeBase = unaGolosina
  }

  override method peso() = golosinaDeBase.peso() + pesoBaniado
  override method precio() = golosinaDeBase.precio() + 2
  override method sabor() = golosinaDeBase.sabor()
  override method libreDeGluten() = golosinaDeBase.libreDeGluten()

  override method mordisco() {
    golosinaDeBase.mordisco()
    cantidadDeMordiscos += 1
    pesoBaniado = 0.max(pesoBaniado - if(cantidadDeMordiscos <= 2) 2 else 0)
  }
}



class Tutti inherits Golosina(peso = 5, sabor = frutilla, precio = if(libreDeGluten) 7 else 10){
  override method precio() = if(libreDeGluten) 7 else 10
  
  override method mordisco(){
    sabor = sabor.siguienteSabor()
  }
}