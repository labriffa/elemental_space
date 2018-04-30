//
//  GroundSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 29/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class GroundSprite : SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 640, height: 72)
    
    init() {
        super.init(texture: nil, color: .black, size: initialSize)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: initialSize)
        self.physicsBody?.collisionBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.categoryBitMask = PhysicsCategory.ground.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

