//
//  JSONProcessing.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 5/12/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation

/*Dictionary de JSON
{
"authors": "Scott Chacon, Ben Straub",
"image_url": "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg",
"pdf_url": "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf",
"tags": "version control, git",
"title": "Pro Git"
},
*/


//MARK - Aliases

typealias JSONObject     = AnyObject
typealias JSONDictionary = [String:JSONObject]
typealias JSONArray      = [JSONDictionary]


//MARK - Errors
enum JSONProcessingErrors : ErrorType {
    
    case WrongURLFormatForJSONResource //URL Mal Formada
    case ResourcePointedByURLNotReachable //No puedo alcanzar el recurso al que apunta la URL
    case JSONParsingError //Que la clase JSONSerialization no pueda parsearlo
    case WrongJSONFormat//Que el formato del JSON esté mal. Falta algun campo, algun campo está mal escrito....
    //case NilJSONObject //Que el JSON sea nulo.
    
}

//MARK - Claves
//Se crea un enum para las claves del JSON

enum JSONKeys : String {
    
    case authors  = "authors"
    case image_url  = "image_url"
    case pdf_url = "pdf_url"
    case tags = "tags"
    case title = "title"
    
    
}

//MARK - Structs
struct StrictAGTBook {
    
    let titulo    : String //String
    let autores   : NSArray //NSArray
    let tags      : NSArray //NSArray
    let imageBook : NSURL //NSURL
    let pdfBook   : NSURL //NSURL
    
}


//MARK - Decoding

//Se coge un diccionario del JSON y se convierte en un objeto AGTBook
func decode (agtBook jsonDictionary : JSONDictionary) throws -> StrictAGTBook {//-> AGTBook {
    
    //El diccionario que me llega puede estar lleno de errores, por lo que tenemos que controlar los posibles problemas con guard
    
    //Comprobamos que image_url y pdf_url es una cadena y que esa cadena es una URL correcta.
    //Se hace  un casteo a String ya que obtengo por cada "clave" del JSON obtengo un AnyObject y necesito un String (en el caso de la URL) y que la URL es correcta
    //rawValue devuelve el valor de la constante de la enum
    guard let urlImageUrl = jsonDictionary [JSONKeys.image_url.rawValue] as? String,  image_url = NSURL(string: urlImageUrl)  else {
        
        throw JSONProcessingErrors.WrongURLFormatForJSONResource
        
        
    }
    
    guard let urlPdfUrl = jsonDictionary [JSONKeys.pdf_url.rawValue] as? String,  pdf_url = NSURL(string: urlPdfUrl)  else {
        
        throw JSONProcessingErrors.WrongURLFormatForJSONResource
        
        
    }
    
    
    //Que el titulo no sea una cadena
    guard let title = jsonDictionary [JSONKeys.title.rawValue] as? String else{
        
        throw JSONProcessingErrors.WrongJSONFormat
        
    }
    
    //Ya se han realizado las comprobaciones y todo es OK
    
    //Se extrae del JSON los parametros que no vamos a comprobar (En este caso authors y tags)
    
    //¿?
    //let authors  = (jsonDictionary [JSONKeys.authors.rawValue] as? NSArray)!
    //let tags  = (jsonDictionary [JSONKeys.tags.rawValue] as? NSArray)!
    
    
    //Que authors y tags no sean NSArray
    guard let authors  = jsonDictionary [JSONKeys.authors.rawValue] as? NSArray else{
        
        throw JSONProcessingErrors.WrongJSONFormat
    }
    
    guard let tags  = jsonDictionary [JSONKeys.tags.rawValue] as? NSArray else{
        
        throw JSONProcessingErrors.WrongJSONFormat
    }
    
    
    //Se crea el AGTBook
    /*return AGTBook.init(titulo: title,
        autores: authors,
        tags: tags,
        imageBook: image_url,
        pdfBook: pdf_url)*/
    
    //Se crea el StrictAGTBook
    return StrictAGTBook.init(titulo: title,
        autores: authors,
        tags: tags,
        imageBook: image_url,
        pdfBook: pdf_url)
    
    }

//Se necesita otro decode, para descodificar un Array de diccionarios de AGTBook
//Lo tengo que convertir en un Array de StrictAGTBook
func decode (agtBooks json : JSONArray) -> [StrictAGTBook]{
    
    //Creo un array vacio para guardar los StrictAGTBook
    var results = [StrictAGTBook]()
    
    do{
    
        //Recorrer el JSONArray
        for dict in json{
        
            //JSONDict que veo, se convierte en StrictAGTBook (lo hace el decode de arriba)
            let book = try (decode(agtBook: dict))
        
            //Lo guardo en el array
            results.append((book))
        
        }
    }catch{
        
        print ("Error al convertir el JSONDictionarty a StrictAGTBook")
        fatalError()
    }
    
    //Devuelvo el Array de StrictAGTBook
    return results
    
}



//Inicializador de conveniencia para cuando pasamos un StrictAGTBook
//MARK: - Initialization AGTBook

extension AGTBook {
    
    //Init que acepta los parametros empaquetados en un StrictAGTBook
    convenience init (strictAGTBook c:StrictAGTBook){
        
        //Llamar al inicializador designado pasandole el StrictAGTBook
        self.init(titulo : c.titulo,
        autores  : c.autores,
        tags     : c.tags,
        imageBook: c.imageBook,
        pdfBook  : c.pdfBook)
        
        
    }
    
}

extension AGTLibrary{
    
    
    //Init que convierte un Array de StrictAGTBook y devuelve un AGTLibrary
    convenience init (books bks: [StrictAGTBook]){
        
        var books = [AGTBook]()
        //Recorrer el array de StrictAGTBook
        for book in bks {
            
            //Lo transformo en AGTBook
            let c = AGTBook (strictAGTBook: book)
            //Lo guardo en un array
            books.append(c)
            
        }
        //Le paso el array al init de AGTLibrary para que me cree el modelo AGTLibrary
        
            //self.init (arrayOfBooks:books)
        
    }
        
        
        
}
    
























    




