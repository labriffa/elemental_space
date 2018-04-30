//
//  ElementBlockFactory.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 29/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

struct ElementBlockFactory {
    static func createInstance(elementType: String)->ElementBlockSprite? {
        
        switch elementType {
        case "Alkali":
            return ElementBlockSprite(element: ElementManager.getRandomAlkaliElement())
        case "TransitionMetal":
            return ElementBlockSprite(element: ElementManager.getRandomTransitionMetalElement())
        case "Halogen":
            return ElementBlockSprite(element: ElementManager.getRandomHalogenElement())
        default:
            return ElementBlockSprite(element: ElementManager.getRandomElement())
        }
    }
}
