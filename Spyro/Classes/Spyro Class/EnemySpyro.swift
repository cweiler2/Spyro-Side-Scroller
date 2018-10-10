//
//  EnemySpyro.swift
//  Spyro
//
//  Created by Cody Weiler on 1/15/18.
//  Copyright © 2018 Cody Weiler. All rights reserved.
//

import SpriteKit

class EnemySpyro: SKSpriteNode {
    
    let enemySpyroTexture = SKTexture(imageNamed: "enemyspyro")
    
    func initialize() {
        self.name = "EnemySpyro"
        self.size.width = 117
        self.size.height = 79
        self.zPosition = 2
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: (self.size.height/2)+10))
        /*self.physicsBody = SKPhysicsBody(texture: enemySpyroTexture, size: CGSize(width: self.size.width, height: self.size.height)) */
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.categoryBitMask = Collider.EnemySpyro
        self.physicsBody?.collisionBitMask = Collider.Spyro
        self.physicsBody?.contactTestBitMask = Collider.Button
    }
    
    func enemySpyroMoveLeft() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: -100, dy: 0))
    }
    
    func enemySpyroGetXPosition() -> CGFloat {
        return self.position.x
    }
    
    func enemySpyroGetYPostition() -> CGFloat {
        return self.position.y
    }
}
