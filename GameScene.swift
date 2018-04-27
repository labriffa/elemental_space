//
//  GameScene.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var elementBlocks:[ElementBlockSprite] = []
    var elementManager:ElementManager = ElementManager()
    
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
