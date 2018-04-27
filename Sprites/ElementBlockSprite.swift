//
//  ElementBlockSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class ElementBlockSprite : SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 50, height: 50)
    var element: Element!
    
    init(element: Element) {
        super.init(texture: nil, color: .black, size: initialSize)
        self.element = element
        self.addChild(createElementLabel(elementName: element.name))
    }
    
    func createElementLabel(elementName: String)->SKLabelNode {
        let elementLabel = SKLabelNode()
        elementLabel.text = element.name
        elementLabel.fontSize = 30
        elementLabel.horizontalAlignmentMode = .center
        elementLabel.verticalAlignmentMode = .center
        return elementLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
