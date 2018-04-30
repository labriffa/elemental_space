//
//  ElementManager.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation
import UIKit

final class ElementManager {
    
    private static var elements:[Element] = []
    
    // individual family elements
    // to allow quick retrieval of specific elements during
    // game run-time
    public static var alkaliElements:[Element] = []
    public static var transitionElements:[Element] = []
    public static var halogenElements:[Element] = []
    
    public static let shared = ElementManager()
    
    private init() {
        if let jsonArray = JsonReader.parse(resource: "elements", type: "json") {
            for obj in jsonArray {
                if let dict = obj as? NSDictionary {
                                        
                     if let symbol  = dict.value(forKey: "symbol") as? String,
                        let name    = dict.value(forKey: "name") as? String,
                        let family  = dict.value(forKey: "family") as? String,
                        let red     = dict.value(forKey: "red") as? Float32,
                        let green   = dict.value(forKey: "green") as? Float32,
                        let blue    = dict.value(forKey: "blue") as? Float32,
                        let summary = dict.value(forKey: "summary") as? String {
                                                
                        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
                        
                        if let elementFamily = ElementFamilyFactory.createInstance(familyType: family) {
                            let element = Element(symbol: symbol, name: name, color: color, summary: summary, family: elementFamily)
                            
                            ElementManager.elements.append(element)
                            
                            if elementFamily is AlkaliFamily {
                                ElementManager.alkaliElements.append(element)
                            } else if elementFamily is TransitionMetalFamily {
                                ElementManager.transitionElements.append(element)
                            } else if elementFamily is HalogenFamily {
                                ElementManager.halogenElements.append(element)
                            }
                        }
                    }
                }
            }
        }
    }
    
    public static func getRandomElement() -> Element {
        let index = Randomizer.random(upperbound: elements.count)
        return elements[index]
    }
    
    public static func getRandomAlkaliElement() -> Element {
        let index = Randomizer.random(upperbound: alkaliElements.count)
        return alkaliElements[index]
    }
    
    public static func getRandomTransitionMetalElement() -> Element {
        let index = Randomizer.random(upperbound: transitionElements.count)
        return transitionElements[index]
    }
    
    public static func getRandomHalogenElement() -> Element {
        let index = Randomizer.random(upperbound: halogenElements.count)
        return halogenElements[index]
    }
}
