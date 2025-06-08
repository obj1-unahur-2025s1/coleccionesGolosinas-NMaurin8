import golosinas.*

object mariano{
    const property golosinas = []
    const sabores = #{frutilla, chocolate, naranja, vainilla, melon}
    const desechadas = #{}
    method comprar(unaGolosina){
        golosinas.add(unaGolosina)
    }
    method desechar(unaGolosina){
        if(not golosinas.contains(unaGolosina)){
            self.error("La golosina no se encuentra.")
        }
        golosinas.remove(unaGolosina)
        desechadas.add(unaGolosina)
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

    method gastoEn(sabor) = self.golosinasDeSabor(sabor).sum({golosina => golosina.precio()})

    method cantidadGolosinas(unSabor) = golosinas.count({golosina => golosina.sabor() == unSabor})
    method saborMasPopular() = sabores.max({sabor => self.cantidadGolosinas(sabor)})

    method saborConMayorPeso(unSabor) = self.golosinasDeSabor(unSabor).max({golosina => golosina.peso()})
    
    method saborMasPesado() = golosinas.max({golosina => self.saborConMayorPeso(golosina.sabor()).peso()})

    method comproYDesecho(unaGolosina) = desechadas.contains(unaGolosina)
}

