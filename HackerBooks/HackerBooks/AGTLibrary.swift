//
//  AGTLibrary.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 6/12/15.
//  Copyright © 2015 FJC. All rights reserved.
//

//Representa el conjunto de libros
import Foundation


class AGTLibrary {

    //Array de libros
    var books : NSMutableArray
    
    
    //Array de tags con todas las distintas tematicas en
    //orden alfabetico. No piede bajo ningún concepto haber
    //ninguno repetido
    var tags : NSMutableArray
    
    
    //Numero total de libros
    var booksCount : Int {
        get{
            let count : Int = self.books.count
            return count
            
        }
    }


    //Cantidad de libros que hay en una temática
    //Si el tag no existe debe devolver cero
    func bookCountForTag (tag : String?)->Int{
        
    }

    
    //Array de libros (instancias de AGTBook) que hay en
    //una tematica
    //Un libro puede estar en una o más temáticas. si no 
    //libros para una temática, ha de devolver nil
    func booksForTag (tag : String?) -> [AGTBook]{
        
    }
    
    
    
    //Un AGTBook para el libro que está en la posición 
    //'index' de aquellos bajo un cierto tag.Usar el 
    //metodo anterior para hacer parte del trabajo
    //Si el indice no existe o el tag no existe ha de 
    //devolver nil.
    
    func bookAtIndex(index:Int)->AGTBook?{
        
    }
    
    
    
}


