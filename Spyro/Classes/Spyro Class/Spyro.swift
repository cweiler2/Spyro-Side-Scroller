//
//  Spyro.swift
//  Spyro
//
//  Created by Cody Weiler on 10/22/17.
//  Copyright © 2017 Cody Weiler. All rights reserved.
//

import SpriteKit

struct Collider {
    static let Button: UInt32 = 0
    static let Spyro: UInt32 = 1
    static let TopBoundry: UInt32 = 2
    static let BottomBoundry: UInt32 = 3
    static let FireBall: UInt32 = 4
    static let EnemySpyro: UInt32 = 5
    static let EnemyFireBall: UInt32 = 6
}

class Spyro: SKSpriteNode {
    let spyroTexture = SKTexture(imageNamed: "spyro")
    let fireSpyroTexture = SKTexture(imageNamed: "firespyro")
    var fireSpyroAnimation = [SKTexture]()
    var fireSpyroAction = SKAction()
    
    
    func initialize() {
        self.name = "Spyro"
        self.size.width = 117
        self.size.height = 79
        self.zPosition = 2
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        self.physicsBody = SKPhysicsBody(texture: spyroTexture, size: CGSize(width: self.size.width, height: self.size.height))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.categoryBitMask = Collider.Spyro
        self.physicsBody?.collisionBitMask = Collider.TopBoundry | Collider.BottomBoundry
        self.physicsBody?.contactTestBitMask = Collider.TopBoundry | Collider.BottomBoundry
    }
    
    func spyroMoveUp() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 110))
    }
    
    func spyroMoveDown() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -110))
    }
    
    func spyroStop() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
    }
    
    func spyroGetXPosition() -> CGFloat {
        return self.position.x
    }
    
    func spyroGetYPostition() -> CGFloat {
        return self.position.y
    }
    
    func setTexture(texture: SKTexture) {
        self.texture = texture
    }
}















