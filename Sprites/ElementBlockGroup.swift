//
//  ElementBlockGroupingSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 30/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation
import SpriteKit

class ElementBlockGroup: SKSpriteNode {
    
    var initialSize: CGSize = CGSize(width:200, height:200)
    var elementBlocks:[ElementBlock] = []
    
    // percentage frequency to employ the linear strategy
    public let LINEAR_STRATEGY_FREQUENCY = 0.5
    
    private var gameScene:SKScene!
    
    private var amount:Int = 4
    
    init(amount:Int, gameScene: SKScene) {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.gameScene = gameScene
        self.addPhysics()
    }

    public func spawn() -> ElementBlockGroup {
        let rand = Randomizer.random(upperbound: self.amount)
            
        if Double(rand) <= Double(amount) * self.LINEAR_STRATEGY_FREQUENCY {
            self.linearMovementStrategy()
        } else {
            self.spinningMovementStrategy()
        }
        
        return self
    }
    
    private func linearMovementStrategy() {
        for i in 0...self.amount-1 {
            
            let elementBlockSprite = self.createBlock()
            
            elementBlockSprite.position.x = (
                (self.gameScene.size.width / CGFloat(self.amount))
                    * CGFloat(i)) + self.initialSize.width / CGFloat(self.amount)
            
            elementBlockSprite.position.y = self.gameScene.frame.maxY + elementBlockSprite.initialSize.height
            self.elementBlocks.append(elementBlockSprite)
            self.addChild(elementBlockSprite)
        }
    }
    
    private func spinningMovementStrategy() {
        
        self.position.x = self.gameScene.frame.midX
        self.position.y = self.gameScene.frame.maxY + self.size.height
        
        for i in 0...self.amount-1 {
            let elementBlockSprite = self.createBlock()
            
            let bezierPath = UIBezierPath(
                arcCenter: CGPoint(x: 0, y: 0),
                radius: CGFloat(elementBlockSprite.initialSize.width),
                startAngle: CGFloat(0),
                endAngle:CGFloat(Double.pi * 2), clockwise: true)
            
            let move = SKAction.follow(bezierPath.cgPath, asOffset: false, orientToPath: true, speed: CGFloat((i+1)*45))

            elementBlockSprite.position.x = (
                (self.gameScene.size.width / CGFloat(self.amount))
                    * CGFloat(i)) + self.initialSize.width / CGFloat(self.amount)
            
            elementBlockSprite.position.y = self.gameScene.frame.maxY + elementBlockSprite.initialSize.height

            elementBlockSprite.run(SKAction.repeatForever(move))
            
            self.elementBlocks.append(elementBlockSprite)
            self.addChild(elementBlockSprite)
        }
    }
    
    private func addPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: initialSize)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.ground.rawValue
        self.physicsBody?.collisionBitMask = 64
    }
    
    private func createBlock(type:String = "random") -> ElementBlock {
        return ElementBlockFactory.createInstance(elementType: type)!
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
