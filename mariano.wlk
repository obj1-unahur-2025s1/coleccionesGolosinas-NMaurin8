import golosinas.*

object mariano{
    const property golosinas = []

    method comprar(unaGolosina){
        golosinas.add(unaGolosina)
    }
    method desechar(unaGolosina){
        golosinas.remove(unaGolosina)
    }
    method cantidadDeGolosinas() = golosinas.size()

    method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)

    method probarGolosinas(){
        golosinas.forEach({golosina => golosina.mordisco()})
    }

    method hayGolosinaSinTACC() = golosinas.any({golosina => golosina.libreDeGluten()})

    method preciosCuidados() = golosinas.all({golosina => golosina.precio() <= 10})

    method golosinaDeSabor(unSabor) = golosinas.find({golosina => golosina.sabor() == unSabor})
    method golosinasDeSabor(unSabor) = golosinas.filter({golosina => golosina.sabor() == unSabor})

    method sabores() = golosinas.map({golosina => golosina.sabor()}).asSet()

    method golosinaMasCara() = golosinas.max({golosina => golosina.precio()})

    method pesoGolosinas() = golosinas.sum({golosina => golosina.peso()})

    method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.filter({golosina => !golosinas.contains(golosina)})

    method gustosFaltantes(gustosDeseados) = gustosDeseados.filter({gusto => !self.sabores().contains(gusto)})
}

