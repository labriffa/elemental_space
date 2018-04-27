//
//  ElementManager.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

class ElementManager {
    
    public var elements:[Element] = []
    
    init() {
        if let jsonArray = JsonReader.parse(resource: "elements", type: "json") {
            for obj in jsonArray {
                if let dict = obj as? NSDictionary {
                     if let symbol  = dict.value(forKey: "symbol") as? String,
                        let name    = dict.value(forKey: "name") as? String,
                        let family  = dict.value(forKey: "family") as? String {
                        
                        if let elementFamily = ElementFamilyFactory.createInstance(familyType: family) {
                            elements.append(Element(symbol: symbol, name: name, family: elementFamily))
                        }
                    }
                }
            }
        }
    }
}
