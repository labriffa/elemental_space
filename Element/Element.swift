//
//  Element.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import UIKit

struct Element {
    public let symbol: String
    public let name: String
    public let color: UIColor
    public let summary: String
    public let family: ElementFamily
    
    init(symbol: String, name: String, color: UIColor, summary: String, family: ElementFamily) {
        self.symbol = symbol
        self.name = name
        self.color = color
        self.summary = summary
        self.family = family
    }
}


