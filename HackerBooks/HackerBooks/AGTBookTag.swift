//
//  AGTBookTag.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 10/12/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation


//let FAVORITE = "Favorite"
class AGTBookTag : Equatable, Comparable {
    
    
    //MARK:  - Properties
    var tagName: NSString
    
    var isFavorite: Bool {
        get {
            return self.isFavorite
        }
    }
    
    
    //MARK:  - initWithName:(NSString *)tagName
    init (tagName : NSString) {
        
        self.tagName = tagName;
        
    }
    
    //- (NSString *)normalizedName;
    //MARK: - Utils
    func normalizedName(aString: NSString) -> String {
        
        var norm: String = ""
        
        if aString.length <= 1 {
            
            //Se indica la primera letra en Mayusculas
            norm = aString.capitalizedString
        }
        else {
            
            norm = "\(aString.substringToIndex(1).uppercaseString)\(aString.substringFromIndex(1).lowercaseString)"
        }
        return norm
    }
    
    
    //MARK - Proxies (Para comparar por propiedades)
    //Protocolo EQUATABLE y COMPARABLE
    var proxyForComparision : String {
        
        get {
            
            return "\(tagName)"
        }
        
    }
    
    
}

    //MARK: - EQUATABLE
    
    //Protocolo EQUATABLE (==)
    func == (lhs : AGTBookTag, rhs : AGTBookTag) -> Bool{
    
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


    //Protocolo COMPARABLE
    func < (lhs: AGTBookTag, rhs: AGTBookTag) -> Bool {
        
        return (lhs.proxyForComparision < rhs.proxyForComparision)

    }



    







