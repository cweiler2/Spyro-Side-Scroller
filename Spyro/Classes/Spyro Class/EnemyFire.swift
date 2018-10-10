//
//  EnemyFire.swift
//  Spyro
//
//  Created by Cody Weiler on 1/29/18.
//  Copyright © 2018 Cody Weiler. All rights reserved.
//

import SpriteKit
import Foundation

class EnemyFire: SKSpriteNode {
    
    let enemyFire = SKTexture(imageNamed: "enemyfireball")
    
    
    func initialize() {
        self.texture = enemyFire
        self.name = "enemyfire"
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size.height = 30
        self.size.width = 30
        self.zPosition = 5
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = Collider.EnemyFireBall
        self.physicsBody?.collisionBitMask = Collider.EnemySpyro
        self.physicsBody?.contactTestBitMask = Collider.EnemySpyro | Collider.FireBall
    }
    
    
}
