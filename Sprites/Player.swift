//
//  PlayerSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 80, height: 80)
    
    func fire(maxHeight:CGFloat) {
        let bullet = BulletSprite()
        let action = SKAction.moveTo(y: maxHeight + bullet.size.height, duration: 0.5)
        let actionDone = SKAction.removeFromParent()
        bullet.run(SKAction.sequence([action, actionDone]))
        self.addChild(bullet)
    }
    
    init() {
        super.init(texture: nil, color: .white, size: initialSize)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: initialSize)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = PhysicsCategory.player.rawValue
        self.physicsBody?.collisionBitMask = PhysicsCategory.ground.rawValue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
