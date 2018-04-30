//
//  Randomizer.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 28/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

struct Randomizer {
    public static func random(upperbound:Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperbound)))
    }
}

