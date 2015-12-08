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
    
    
    
    //MARK: - Private Interface
    
    //Array de tags con todas las distintas tematicas en
    //orden alfabetico. No puede bajo ningún concepto
    //haber ninguno repetido
    private var tags : NSMutableArray
    
    //Se guardan los libros en un diccionario
    //cuyas claves son los tags y su valor son
    //arrays de AGTBook
    private let books : [String:[AGTBook]]
    
    
    
    //MARK: - Initialization
    /*init (arrayOfBooks: [AGTBook]){
        
        //Se inicializa la propiedad books y se le meten libros
        var books = Dictionary<String,Array<AGTBook>>()
    
        /*for each in self.tags {
            
            books[each] = Array<AGTBook>
            
        }*/
        
        //Segun los tags lo metemos en un sitio u otro
        
        for book in arrayOfBooks{
            
            
            books[tags]?.append(book)
         
            
            
        }
        
    }*/
    
    
    
    
    
    //Array de libros
    //var books : NSMutableArray
    
    
    
    //MARK: Public interface
    
    //Numero total de libros
    var booksCount : Int {
        get{
            let count : Int = self.books.count
            return count
            
        }
    }
    
    //Numero Total de Tags
    var tagsCount : Int{
        get{
            
            let count : Int = self.tags.count
            return count
        }
    }

    
    //Cantidad de libros que hay en una temática
    //Si el tag no existe debe devolver cero
    
    //Repasar
    func bookCountForTag (tag : String) -> Int{
        
        if let bks = books[tag]{
            
            return bks.count
        }
        
        return 0
    }
    
    //El libro n del tag m
    subscript (idx: Int, inTag tag: String)->AGTBook?{
        //Obtener el array de tags y el libro en esa posicion
        get {
            if let bks = books[tag]{
                return bks[idx]
            }
            return nil
        }
    }
    
    
    /*
    
    //Array de libros (instancias de AGTBook) que hay en
    //una tematica
    //Un libro puede estar en una o más temáticas. si no
    //hay libros para una temática, ha de devolver nil
    func booksForTag (tag : String?) -> [AGTBook]{
        
    }
    
    
    
    //Un AGTBook para el libro que está en la posición 
    //'index' de aquellos bajo un cierto tag.Usar el 
    //metodo anterior para hacer parte del trabajo
    //Si el indice no existe o el tag no existe ha de 
    //devolver nil.
    
    func bookAtIndex(index:Int)->AGTBook?{
        
    }
    
    */
    
}


