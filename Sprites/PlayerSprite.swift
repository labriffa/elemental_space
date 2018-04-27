//
//  PlayerSprite.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 64, height: 64)
    
    func onTap() {
        self.fire()
    }
    
    private func fire() {
    
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
