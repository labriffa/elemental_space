//
//  Element.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

class Element {
    public let symbol: String
    public let name: String
    public let family: ElementFamily
    
    init(symbol: String, name: String, family: ElementFamily) {
        self.symbol = symbol
        self.name = name
        self.family = family
    }
}


