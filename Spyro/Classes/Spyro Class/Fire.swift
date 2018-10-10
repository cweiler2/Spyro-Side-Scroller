//
//  Fire.swift
//  Spyro
//
//  Created by Cody Weiler on 1/24/18.
//  Copyright © 2018 Cody Weiler. All rights reserved.
//

import SpriteKit
import Foundation

class Fire: SKSpriteNode {
    
    let fire = SKTexture(imageNamed: "fireball")
    
    
    func initialize() {
        self.texture = fire
        self.name = "fire"
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size.height = 30
        self.size.width = 30
        self.zPosition = 5
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = Collider.FireBall
        self.physicsBody?.collisionBitMask = Collider.EnemySpyro
        self.physicsBody?.contactTestBitMask = Collider.EnemySpyro | Collider.EnemyFireBall
    }
    
    
}
