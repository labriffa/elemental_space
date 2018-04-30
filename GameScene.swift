//
//  GameScene.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion
import AVFoundation


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:PlayerSprite = PlayerSprite()
    var elementBlocks: [ElementBlockSprite] = []
    var elementManager: ElementManager = ElementManager.shared
    var timer:Timer!
    var ground:SKSpriteNode!
    var sound: AVAudioPlayer?

    
    let motion = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        // Initialize Player
        player.position = CGPoint(x: frame.midX, y: frame.minY + player.size.height) 
        self.addChild(player)
        
        // Spawn Element Blocks
        let wait = SKAction.wait(forDuration: 3, withRange: 2)
        let spawn = self.spawnBlockGroup()
        let spawnSequence = SKAction.sequence([wait, spawn])
        self.run(SKAction.repeatForever(spawnSequence))
                
        // Start the Accelerometer
        motion.startAccelerometerUpdates()
        
        self.startAccelerometers()
        
        self.addParticleEmitter()
        
        self.physicsWorld.contactDelegate = self
        self.size = view.bounds.size
        self.anchorPoint = CGPoint(x:0,y:0)
        
        let path = Bundle.main.path(forResource: "rainbow.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            sound = try AVAudioPlayer(contentsOf: url)
            sound?.play()
        } catch {
            // couldn't load file :(
        }

    }
    
    func endGame() {
        self.sound?.stop()
        self.removeAllActions()
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.fire(maxHeight:self.frame.maxY)
        
        let touch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "pause"
            {
                self.endGame()
            }
        } else {
            self.player.fire(maxHeight:self.frame.maxY)
        }
    }

    override func update(_ currentTime: TimeInterval) {
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "ground" || contact.bodyB.node?.name == "ground" {
            if contact.bodyA.node?.name == "block" {
                contact.bodyA.node?.removeFromParent()
            } else if contact.bodyB.node?.name == "block" {
                contact.bodyB.node?.removeFromParent()
            }
        }
        
        if contact.bodyA.node?.name == "bullet" || contact.bodyB.node?.name == "bullet" {
            if contact.bodyA.node?.name == "block" {
                contact.bodyA.node?.removeFromParent()
                player.removeAllChildren()
            } else if contact.bodyB.node?.name == "block" {
                contact.bodyB.node?.removeFromParent()
                player.removeAllChildren()
            }
        }
    }

    func startAccelerometers() {
        if self.motion.isAccelerometerAvailable {
            motion.accelerometerUpdateInterval = 1.0 / 60.0
            motion.startAccelerometerUpdates()
            
            timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data
                                if let data = self.motion.accelerometerData {
                                    let x = data.acceleration.x
                                    self.player.physicsBody?.applyImpulse(CGVector(dx: 35 * CGFloat(x), dy: 0))
                                }
            })
            
            // Add the timer to the current run loop
            RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
        }
    }
    
    func addParticleEmitter() {
        let particlePath = Bundle.main.path(forResource: "SparkleParticle", ofType: "sks")!
        let particle = NSKeyedUnarchiver.unarchiveObject(withFile: particlePath) as! SKEmitterNode
        particle.position.y = self.frame.maxY - 200
        particle.targetNode = self
        self.addChild(particle)
    }
    
    func spawnBlockGroup() -> SKAction {
        let spawn = SKAction.run {
            let rand = Randomizer.random(upperbound: 5)
            if rand <= 3 {
                self.linearElementBlocks()
            } else {
                self.spinningElementBlocks()
            }
        }
        
        return spawn
    }
    
    func linearElementBlocks() {
        for i in 0...3 {
            let elementBlockSprite = ElementBlockFactory.createInstance(elementType: "random")!
            
            
            elementBlockSprite.position.x = ((self.size.width / CGFloat(4)) * CGFloat(i)) + CGFloat(50)
            elementBlockSprite.position.y = self.frame.maxY + elementBlockSprite.initialSize.height
            
            self.elementBlocks.append(elementBlockSprite)
            self.addChild(elementBlockSprite)
        }
    }
    
    func spinningElementBlocks() {
        let parent = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 200, height: 200))
        parent.position.x = self.frame.midX
        parent.position.y = self.frame.maxY + parent.size.height
        parent.physicsBody = SKPhysicsBody(rectangleOf: parent.size)
        parent.physicsBody?.collisionBitMask = 64
        parent.physicsBody?.categoryBitMask = 64
        
        for i in 0...3 {
            let elementBlockSprite = ElementBlockFactory.createInstance(elementType: "random")!
            
            let bezierPath = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            let move = SKAction.follow(bezierPath.cgPath, asOffset: false, orientToPath: true, speed: CGFloat((i+1)*45))
            elementBlockSprite.physicsBody?.affectedByGravity = true
            elementBlockSprite.position.x = ((self.size.width / CGFloat(4)) * CGFloat(i)) + CGFloat(50)
            elementBlockSprite.position.y = ((self.size.height / CGFloat(4)) * CGFloat(i)) + CGFloat(50)
            elementBlockSprite.position.x = ((self.size.width / CGFloat(4)) * CGFloat(i)) + CGFloat(50)
            
            
            elementBlockSprite.run(SKAction.repeatForever(move))
            
            elementBlockSprite.position.y = self.frame.maxY + elementBlockSprite.initialSize.height
            self.elementBlocks.append(elementBlockSprite)
            parent.addChild(elementBlockSprite)
        }
        
        self.addChild(parent)
    }
}

enum PhysicsCategory:UInt32 {
    case player = 1
    case ground = 2
    case block = 4
    case coin = 8
    case powerup = 16
    case bullet = 32
}
