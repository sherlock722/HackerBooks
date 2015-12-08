//
//  FoundationExtension.swift
//  StarWarsVII
//
//  Created by Javier Cazorla Moriche on 22/11/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation

extension NSBundle {
    
    
    //En fileName recibo nombre.extension
    //NSURL te devuelve un opcional (NSURL?)
    func URLForResosurce (fileName: String)->NSURL?{
        
        //deberes para casa: gestionar errores en caso de 
        //no sea del tipo nombre.extension
        //crear un enum que gestione los errores
        let tokens = fileName.componentsSeparatedByString(".")
        
        return self.URLForResource(tokens.first, withExtension: tokens.last)
        
        
    }
}