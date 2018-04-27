//
//  ElementFactory.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

struct ElementFamilyFactory {
    static func createInstance(familyType: String)->ElementFamily? {
        switch familyType {
        case "Alkali":
            return AlkaliFamily()
        case "TransitionMetal":
            return TransitionMetalFamily()
        case "Halogen":
            return HalogenFamily()
        default:
            return nil
        }
    }
}
