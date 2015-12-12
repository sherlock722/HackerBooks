//
//  AGTMultiDictionary.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 10/12/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import Foundation


class AGTMultiDictionary {
    
    var dict: [NSObject : AnyObject] = [NSObject : AnyObject]()
    
    
    //Mark: - init
    init() {
        
        //if self.init() {
            self.dict = [NSObject : AnyObject]()
        //}
    }

//Mark: -  accessors



    //Mark: - NSObject
    func description() -> String {
        return "<\(self):\n \(dict)>"
    }
}