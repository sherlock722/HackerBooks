//
//  AGTBook.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 30/11/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation

class AGTBook:NSObject {
    
    let titulo    : String
    let autores   : NSArray
    let tags      : NSArray
    let imageBook : NSURL
    let pdfBook   : NSURL
    

    //MARK: - Init
    init (titulo : String,
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