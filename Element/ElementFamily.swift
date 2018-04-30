//
//  ElementFamily.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import UIKit

protocol ElementFamily {
    var color: UIColor { get set }
    var hitPoints: Int { get set }
    var scorePoints: Int { get set }
}

/**
*    Family Types
**/
struct AlkaliFamily : ElementFamily {
    var color: UIColor = UIColor(red: 255/255, green: 30/255, blue: 128/255, alpha: 1)
    var hitPoints: Int = FamilyHitPoints.ALKALI_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.ALKALI_BASE_HIT_POINTS
}

struct TransitionMetalFamily : ElementFamily  {
    var color: UIColor = UIColor(red: 12/255, green: 254/255, blue: 230/255, alpha: 1)
    var hitPoints: Int = FamilyHitPoints.TRANSITION_METAL_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.TRANSITION_METAL_BASE_HIT_POINTS
}

struct HalogenFamily : ElementFamily {
    var color: UIColor = UIColor(red: 254/255, green: 213/255, blue: 140/255, alpha: 1)
    var hitPoints: Int = FamilyHitPoints.HALOGEN_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.HALOGEN_BASE_HIT_POINTS
}

/**
 *    Family Types
 **/
struct FamilyHitPoints {
    public static let ALKALI_BASE_HIT_POINTS: Int            = 3
    public static let TRANSITION_METAL_BASE_HIT_POINTS: Int  = 10
    public static let HALOGEN_BASE_HIT_POINTS: Int           = 5
}

struct FamilyScores {
    public static let ALKALI_BASE_HIT_POINTS: Int            = 3
    public static let TRANSITION_METAL_BASE_HIT_POINTS: Int  = 10
    public static let HALOGEN_BASE_HIT_POINTS: Int           = 5
}
