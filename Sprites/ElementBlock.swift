//
//  ElementBlockSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class ElementBlock : SKShapeNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 80, height: 80)
    var element: Element!
    
    override init() {
        super.init()
    }
    
    convenience init(element: Element) {
        self.init(circleOfRadius: 40)
        
        self.name = "block"
        self.element = element
        self.fillColor = element.color
        self.lineWidth = 4
        let label = self.createElementLabel()
        self.addPhysics()
        self.addChild(label)
    }
    
    func createElementLabel()->SKLabelNode {
        let elementLabel = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        elementLabel.text = element.symbol
        elementLabel.fontSize = 30
        elementLabel.fontColor = .white
        elementLabel.horizontalAlignmentMode = .center
        elementLabel.verticalAlignmentMode = .center
        return elementLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPhysics() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = PhysicsCategory.block.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.ground.rawValue
        self.physicsBody?.collisionBitMask = PhysicsCategory.ground.rawValue
    }
}
