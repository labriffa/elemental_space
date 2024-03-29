//
//  ElementGroups.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

protocol ElementFamily {
    var hitPoints: Int { get set }
    var scorePoints: Int { get set }
}

class AlkaliFamily : ElementFamily {
    var hitPoints: Int = FamilyHitPoints.ALKALI_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.ALKALI_BASE_HIT_POINTS
}

class TransitionMetalFamily : ElementFamily {
    var hitPoints: Int = FamilyHitPoints.TRANSITION_METAL_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.TRANSITION_METAL_BASE_HIT_POINTS
}

class HalogenFamily : ElementFamily {
    var hitPoints: Int = FamilyHitPoints.HALOGEN_BASE_HIT_POINTS
    var scorePoints: Int = FamilyScores.HALOGEN_BASE_HIT_POINTS
}

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
