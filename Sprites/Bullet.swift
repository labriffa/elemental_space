//
//  BulletSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 29/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class Bullet : SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width:5, height:20)
    
    init() {
        super.init(texture: nil, color: .white, size: initialSize)

        self.zPosition = -1
        self.name = "bullet"
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = PhysicsCategory.bullet.rawValue
        self.physicsBody!.collisionBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
