//
//  AGTBook.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 30/11/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation

//Implementamos el protocolo Equatable
//(para ver si dos objetos son equivalentes). Este protocolo puede
//servir para ordenar

class AGTBook : Equatable, Comparable {
    
    let titulo    : String?
    let autores   : NSArray
    let tags      : NSArray
    let imageBook : NSURL
    let pdfBook   : NSURL
    

    //MARK: - Init
    init (titulo : String?,
        autores  : NSArray,
        tags     : NSArray,
        imageBook: NSURL,
        pdfBook  : NSURL){
            
            self.titulo = titulo
            self.autores = autores
            self.tags = tags
            self.imageBook = imageBook
            self.pdfBook = pdfBook
            
    }
    
    
    //MARK - Proxies (Para comparar por propiedades)
    //Protocolo EQUATABLE
    var proxyForComparision : String {
        
        get {
            return "\(titulo)\(autores)\(tags)\(imageBook)\(pdfBook)"
        }
        
    }
    
    //Protocolo COMPARABLE
    var proxyForSorting : String{
        
        get{
            return "\(titulo)\(tags)"
        }
    }
    
    
    /*convenience init (autores  : NSArray,
        tags     : NSArray,
        imageBook: NSURL,
        pdfBook  : NSURL){
            
            self.init (titulo : nil,
                autores  : autores,
                tags     : tags,
                imageBook: imageBook,
                pdfBook  : pdfBook)
    }*/

}

//Implementamos a traves de una extension el protocolo
//CustomStringConvertible que es como el description en
//ObjectiveC

extension AGTBook : CustomStringConvertible{
    
    var description : String {
     
        get{
            
            if let titulo = titulo {
                return "<\(self.dynamicType): \(titulo)>"
            }else{
                return "<\(self.dynamicType)>"
            }
            
        }
        
    }
    
}

//Si fuera una extension para implementar EQUTABLE: Quedaría
/*extension AGTBook : Equatable{
    
    //Estaria vacia ya que se define la función (operador) fuera
    //de la extensión
    
}*/

//MARK: - Operators

//Protocolo EQUATABLE (==)
func == (lhs : AGTBook, rhs : AGTBook) -> Bool{
    
    //Son el mismo objeto
    guard !(lhs === rhs) else{ //Comparo direcciones de memoria
        return true
    }
    
    //Son clases distintas
    guard lhs.dynamicType == rhs.dynamicType else {
        return false
    }
    
    //Comparar todas las propiedades (patrón de diseño del proxy)
    return (lhs.proxyForComparision == rhs.proxyForComparision)

}

//EQUATABLE(<>)
//El compilador crea  el  <> (distinto) por haber implementado el ==



//Protocolo COMPARABLE
func < (lhs: AGTBook, rhs: AGTBook) -> Bool {
    
    return (lhs.proxyForSorting < rhs.proxyForSorting)
}

//El resto de funciones (>) (<=) y (>=) los deduce el compilador














