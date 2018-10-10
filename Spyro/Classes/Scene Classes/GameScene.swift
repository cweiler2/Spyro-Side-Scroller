//
//  GameScene.swift
//  Spyro
//
//  Created by Cody Weiler on 10/11/17.
//  Copyright © 2017 Cody Weiler. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var spyro = Spyro();
    let upButton = SKSpriteNode()
    let downButton = SKSpriteNode()
    let fireButton = SKSpriteNode()
    let topBoundry = SKSpriteNode()
    let bottomBoundry = SKSpriteNode()
    let retryButton = SKSpriteNode()
    let characterSelectButton = SKSpriteNode()
    let leftBoundry = SKSpriteNode()
    let shootButton1 = SKSpriteNode()
    let shootButton2 = SKSpriteNode()
    
    var scoreLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    var gameOverLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    var finalScoreLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    var highScoreLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    var retryLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    var characterSelectLabel = SKLabelNode(fontNamed: "ChalkboardSe-Bold")
    
    var life1 = SKSpriteNode()
    var life2 = SKSpriteNode()
    var life3 = SKSpriteNode()
    
    var score = 0
    var highScore = 0
    var finalScore = 0
    var lifeCounter = 0
    
    let enemyFire = SKTexture(imageNamed: "enemyfireball")
    let fullLife = SKTexture(imageNamed: "life")
    let emptyLife = SKTexture(imageNamed: "emptylife")
    
    let spyroTexture = SKTexture(imageNamed: "spyro")
    let fireSpyroTexture = SKTexture(imageNamed: "firespyro")
    let blackSpyroTexture = SKTexture(imageNamed: "blackspyro")
    let skyeSpyroTexture = SKTexture(imageNamed: "skye")
    
    let defaults = UserDefaults.standard
    
    struct character {
        static let classic: UInt32 = 1
        static let fire: UInt32 = 2
        static let black: UInt32 = 3
        static let skye: UInt32 = 4
    }
    
    
    
    override func didMove(to view: SKView) {
        initialize()
        incrementScore()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBackgrounds()
        if score <= 10000 {
            let randomNumber = arc4random_uniform(100) + 0 // generates a random # 0-99
            if randomNumber == 1 {
                let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
                enemySpyro.initialize() // initializes new instance of an enemy
                var num1 = Int(arc4random_uniform(260)) // generates a random # 0-259
                let num2 = Int(arc4random_uniform(2)) // generates a random # 0-1
                if num2 == 0 {
                num1 = -num1
                }
            enemySpyro.position = CGPoint(x: 1100, y: num1) // sets the enemies position
            self.addChild(enemySpyro) // adds the enemy to the scene
            enemySpyro.enemySpyroMoveLeft() // moves the enemy towards Spyro
            }
            if score < 0 {
                score = 0
            }
        }
        else if score <= 20000 {
            let randomNumber = arc4random_uniform(90) + 0
            if randomNumber == 1 {
                let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
                enemySpyro.initialize()
                var num1 = Int(arc4random_uniform(260))
                let num2 = Int(arc4random_uniform(2))
                if num2 == 0 {
                    num1 = -num1
                }
                enemySpyro.position = CGPoint(x: 1100, y: num1)
                self.addChild(enemySpyro)
                enemySpyro.enemySpyroMoveLeft()
            }
        }
        else if score <= 30000 {
            let randomNumber = arc4random_uniform(80) + 0
            if randomNumber == 1 {
                let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
                enemySpyro.initialize()
                var num1 = Int(arc4random_uniform(260))
                let num2 = Int(arc4random_uniform(2))
                if num2 == 0 {
                    num1 = -num1
                }
                enemySpyro.position = CGPoint(x: 1100, y: num1)
                self.addChild(enemySpyro)
                enemySpyro.enemySpyroMoveLeft()
            }
        }
        else if score <= 40000 {
            let randomNumber = arc4random_uniform(70) + 0
            if randomNumber == 1 {
                let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
                enemySpyro.initialize()
                var num1 = Int(arc4random_uniform(260))
                let num2 = Int(arc4random_uniform(2))
                if num2 == 0 {
                    num1 = -num1
                }
                enemySpyro.position = CGPoint(x: 1100, y: num1)
                self.addChild(enemySpyro)
                enemySpyro.enemySpyroMoveLeft()
            }
        }
        else {
            let randomNumber = arc4random_uniform(60) + 0
            if randomNumber == 1 {
                let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
                enemySpyro.initialize()
                var num1 = Int(arc4random_uniform(260))
                let num2 = Int(arc4random_uniform(2))
                if num2 == 0 {
                    num1 = -num1
                }
                enemySpyro.position = CGPoint(x: 1100, y: num1)
                self.addChild(enemySpyro)
                enemySpyro.enemySpyroMoveLeft()
            }
        }
        if (self.childNode(withName: "Spyro") == nil) && score > 20 {
            scoreLabel.removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if upButton.contains(location) {
                spyro.spyroMoveUp()
            }
            if downButton.contains(location) {
                spyro.spyroMoveDown()
            }
            if fireButton.contains(location) {
                let fire = Fire()
                fire.initialize()
                fire.position.x = spyro.position.x + 70
                fire.position.y = spyro.position.y
                self.addChild(fire)
                fire.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 0))
                score = score - 200
            }
            if retryButton.contains(location) {
                score = 0
                let gameScene = GameScene(fileNamed: "GameScene")
                gameScene!.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
            }
            if characterSelectButton.contains(location) {
                let characterScene = CharacterScene(fileNamed: "CharacterScene")
                characterScene!.scaleMode = .aspectFill
                self.view?.presentScene(characterScene!, transition: SKTransition.doorway(withDuration: 1))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if upButton.contains(location) {
                spyro.spyroMoveUp()
            }
            if downButton.contains(location) {
                spyro.spyroMoveDown()
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if upButton.contains(location) {
                spyro.spyroStop()
            }
            if downButton.contains(location) {
                spyro.spyroStop()
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Spyro" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "Spyro" && secondBody.node?.name == "topBoundry" {
            spyro.spyroStop()
        }
        else if firstBody.node?.name == "Spyro" && secondBody.node?.name == "bottomBoundry" {
            spyro.spyroStop()
        }
        else if firstBody.node?.name == "Spyro" && secondBody.node?.name == "EnemySpyro" {
            if lifeCounter == 0 {
                spyro.physicsBody?.isDynamic = false
                life3.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
                spyro.physicsBody?.isDynamic = true
            }
            else if lifeCounter == 1 {
                spyro.physicsBody?.isDynamic = false
                life2.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
                spyro.physicsBody?.isDynamic = true
            }
            else if lifeCounter == 2 {
                life1.texture = emptyLife
                let node1 = firstBody.node
                node1?.removeFromParent()
                let node2 = secondBody.node
                node2?.removeFromParent()
                upButton.removeFromParent()
                downButton.removeFromParent()
                fireButton.removeFromParent()
                topBoundry.removeFromParent()
                bottomBoundry.removeFromParent()
                leftBoundry.removeFromParent()
                displayGameOver()
                displayFinalScore()
                displayRetry()
                displayHighScore()
                displayCharacterSelect()
            }
        }
        
        else if firstBody.node?.name == "EnemySpyro" && secondBody.node?.name == "enemyfire" {
            let fireNode = secondBody.node
            fireNode?.removeFromParent()
        }
        else if firstBody.node?.name == "enemyfire" && secondBody.node?.name == "EnemySpyro" {
            let fireNode = firstBody.node
            fireNode?.removeFromParent()
        }
        
        else if firstBody.node?.name == "Spyro" && secondBody.node?.name == "enemyfire" {
            if lifeCounter == 0 {
                spyro.physicsBody?.isDynamic = false
                life3.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
                spyro.physicsBody?.isDynamic = true
                
            }
            else if lifeCounter == 1 {
                spyro.physicsBody?.isDynamic = false
                life2.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
                spyro.physicsBody?.isDynamic = true
            }
            else if lifeCounter == 2 {
                life1.texture = emptyLife
                let node1 = firstBody.node
                node1?.removeFromParent()
                let node2 = secondBody.node
                node2?.removeFromParent()
                upButton.removeFromParent()
                downButton.removeFromParent()
                fireButton.removeFromParent()
                topBoundry.removeFromParent()
                bottomBoundry.removeFromParent()
                leftBoundry.removeFromParent()
                displayGameOver()
                displayFinalScore()
                displayRetry()
                displayHighScore()
                displayCharacterSelect()
            }
        }
        
        else if firstBody.node?.name == "EnemySpyro" && secondBody.node?.name == "fire" {
            let enemyNode = firstBody.node
            let fireNode = secondBody.node
            enemyNode?.removeFromParent()
            fireNode?.removeFromParent()
            score = score + 500
        }
        else if firstBody.node?.name == "fire" && secondBody.node?.name == "EnemySpyro" {
            let fireNode = firstBody.node
            let enemyNode = secondBody.node
            fireNode?.removeFromParent()
            enemyNode?.removeFromParent()
            score = score + 500
        }
        
        else if firstBody.node?.name == "EnemySpyro" && secondBody.node?.name == "leftBoundry" {
            if lifeCounter == 0 {
                life3.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = firstBody.node
                enemy?.removeFromParent()
                
            }
            else if lifeCounter == 1 {
                life2.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = firstBody.node
                enemy?.removeFromParent()
            }
            else if lifeCounter == 2 {
                life1.texture = emptyLife
                let node1 = firstBody.node
                node1?.removeFromParent()
                let node2 = secondBody.node
                node2?.removeFromParent()
                spyro.removeFromParent()
                upButton.removeFromParent()
                downButton.removeFromParent()
                fireButton.removeFromParent()
                topBoundry.removeFromParent()
                bottomBoundry.removeFromParent()
                leftBoundry.removeFromParent()
                displayGameOver()
                displayFinalScore()
                displayRetry()
                displayHighScore()
                displayCharacterSelect()
            }
        }
        else if firstBody.node?.name == "leftBoundry" && secondBody.node?.name == "EnemySpyro" {
            if lifeCounter == 0 {
                life3.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
                
            }
            else if lifeCounter == 1 {
                life2.texture = emptyLife
                lifeCounter = lifeCounter + 1
                let enemy = secondBody.node
                enemy?.removeFromParent()
            }
            else if lifeCounter == 2 {
                life1.texture = emptyLife
                let node1 = firstBody.node
                node1?.removeFromParent()
                let node2 = secondBody.node
                node2?.removeFromParent()
                spyro.removeFromParent()
                upButton.removeFromParent()
                downButton.removeFromParent()
                fireButton.removeFromParent()
                topBoundry.removeFromParent()
                bottomBoundry.removeFromParent()
                leftBoundry.removeFromParent()
                displayGameOver()
                displayFinalScore()
                displayRetry()
                displayHighScore()
                displayCharacterSelect()
            }
        }
        
        else if firstBody.node?.name == "EnemySpyro" && secondBody.node?.name == "shootButton" {
            let random = arc4random_uniform(3)
            if random == 0 {
            let position = firstBody.node?.position
            let enemyFire = EnemyFire()
            enemyFire.initialize()
            enemyFire.position = position! // gives the fireball the enemies postion
            enemyFire.position.x = enemyFire.position.x - 90 // moves the fireball in front of the enemy
            self.addChild(enemyFire)
            enemyFire.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 0)) }
        }
        else if firstBody.node?.name == "shootButton" && secondBody.node?.name == "EnemySpyro" {
            let random = arc4random_uniform(3)
            if random == 0 {
            let position = secondBody.node?.position
            let enemyFire = EnemyFire()
            enemyFire.initialize()
            enemyFire.position = position!
            enemyFire.position.x = enemyFire.position.x - 90
            self.addChild(enemyFire)
            enemyFire.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 0)) }
        }
        
        else if firstBody.node?.name == "fire" && secondBody.node?.name == "enemyfire" {
            let node1 = firstBody.node
            node1?.removeFromParent()
            let node2 = secondBody.node
            node2?.removeFromParent()
        }
        else if firstBody.node?.name == "enemyfire" && secondBody.node?.name == "fire" {
            let node1 = firstBody.node
            node1?.removeFromParent()
            let node2 = secondBody.node
            node2?.removeFromParent()
        }
    }
    
    
    func initialize() {
        physicsWorld.contactDelegate = self
        createSpyro()
        setCharacter()
        createBackgrounds()
        createBoundries()
        createGameButtons()
        createEnemyShootButtons()
        moveBackgrounds()
        displayScore()
        displayLives()
    }
    
    func createSpyro() {
        spyro = Spyro(imageNamed: "spyro")
        spyro.initialize()
        spyro.position = CGPoint(x: -510, y: 0)
        self.addChild(spyro)
    }
    
    func createEnemySpyro() {
        let enemySpyro = EnemySpyro(imageNamed: "enemyspyro")
        enemySpyro.initialize()
        enemySpyro.position = CGPoint(x: 1100, y: Int(arc4random_uniform(300) + 0))
        self.addChild(enemySpyro)
        enemySpyro.enemySpyroMoveLeft()
        
    }
    
    func createBackgrounds() {
        for i in 0...2 {
            let bg = SKSpriteNode(imageNamed: "BG")
            bg.name = "BG"
            bg.zPosition = 0
            bg.size.height = 750
            bg.size.width = 1334
            bg.anchorPoint = CGPoint(x:0.5, y:0.5)
            bg.position = CGPoint(x: CGFloat(i) * bg.size.width, y:0)
            self.addChild(bg)
        }
        
    }
    
    func createGameButtons() {
        upButton.name = "upButton"
        upButton.alpha = 0.0
        upButton.zPosition = 0
        upButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        upButton.position = CGPoint(x:-336.621, y: 187.5)
        upButton.size.width = 661
        upButton.size.height = 375
        upButton.physicsBody = SKPhysicsBody(rectangleOf: upButton.size)
        upButton.physicsBody?.categoryBitMask = Collider.Button
        upButton.physicsBody?.collisionBitMask = Collider.Button
        upButton.physicsBody?.affectedByGravity = false
        self.addChild(upButton)
        
        downButton.name = "downButton"
        downButton.alpha = 0.0
        downButton.zPosition = 0
        downButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        downButton.position = CGPoint(x:-336.621, y: -187.5)
        downButton.size.width = 661
        downButton.size.height = 375
        downButton.physicsBody = SKPhysicsBody(rectangleOf: downButton.size)
        downButton.physicsBody?.categoryBitMask = Collider.Button
        downButton.physicsBody?.collisionBitMask = Collider.Button
        downButton.physicsBody?.affectedByGravity = false
        self.addChild(downButton)
        
        fireButton.name = "fireButton"
        fireButton.alpha = 0.0
        fireButton.zPosition = 0
        fireButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fireButton.position = CGPoint(x:326.621, y: -187.5)
        fireButton.size.width = 661
        fireButton.size.height = 375
        fireButton.physicsBody = SKPhysicsBody(rectangleOf: fireButton.size)
        fireButton.physicsBody?.categoryBitMask = Collider.Button
        fireButton.physicsBody?.collisionBitMask = Collider.Button
        fireButton.physicsBody?.affectedByGravity = false
        self.addChild(fireButton)
        
    }
    
    func createBoundries() {
        topBoundry.name = "topBoundry"
        topBoundry.alpha = 0.0
        topBoundry.zPosition = 2
        topBoundry.anchorPoint = CGPoint(x: 0.5, y:0.5)
        topBoundry.position = CGPoint(x: 0, y: 280)
        topBoundry.size.width = 1334
        topBoundry.size.height = 1
        topBoundry.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: topBoundry.size.width, height: topBoundry.size.height))
        topBoundry.physicsBody?.affectedByGravity = false
        topBoundry.physicsBody?.isDynamic = false
        topBoundry.physicsBody?.restitution = 0.0
        topBoundry.physicsBody?.categoryBitMask = Collider.TopBoundry
        topBoundry.physicsBody?.collisionBitMask = Collider.Spyro
        topBoundry.physicsBody?.contactTestBitMask = Collider.Spyro
        self.addChild(topBoundry)
        
        bottomBoundry.name = "bottomBoundry"
        bottomBoundry.alpha = 0.0
        bottomBoundry.zPosition = 2
        bottomBoundry.anchorPoint = CGPoint(x: 0.5, y:0.5)
        bottomBoundry.position = CGPoint(x: 0, y: -340)
        bottomBoundry.size.width = 1334
        bottomBoundry.size.height = 1
        bottomBoundry.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottomBoundry.size.width, height: bottomBoundry.size.height))
        bottomBoundry.physicsBody?.affectedByGravity = false
        bottomBoundry.physicsBody?.isDynamic = false
        bottomBoundry.physicsBody?.restitution = 0.0
        bottomBoundry.physicsBody?.categoryBitMask = Collider.BottomBoundry
        bottomBoundry.physicsBody?.collisionBitMask = Collider.Spyro
        bottomBoundry.physicsBody?.contactTestBitMask = Collider.Spyro
        self.addChild(bottomBoundry)
        
        leftBoundry.name = "leftBoundry"
        leftBoundry.alpha = 0.0
        leftBoundry.zPosition = 2
        leftBoundry.anchorPoint = CGPoint(x: 0.5, y:0.5)
        leftBoundry.position = CGPoint(x:-650 , y: 0)
        leftBoundry.size.width = 1
        leftBoundry.size.height = 1334
        leftBoundry.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leftBoundry.size.width, height: leftBoundry.size.height))
        leftBoundry.physicsBody?.affectedByGravity = false
        leftBoundry.physicsBody?.isDynamic = false
        leftBoundry.physicsBody?.restitution = 0.0
        leftBoundry.physicsBody?.categoryBitMask = Collider.Button
        leftBoundry.physicsBody?.collisionBitMask = Collider.Button
        leftBoundry.physicsBody?.contactTestBitMask = Collider.EnemySpyro
        self.addChild(leftBoundry)
    }
    
    func createEnemyShootButtons() {
        shootButton1.name = "shootButton"
        shootButton1.alpha = 0.0
        shootButton1.zPosition = 2
        shootButton1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        shootButton1.position = CGPoint(x: 640, y: 0)
        shootButton1.size.width = 1
        shootButton1.size.height = 1334
        shootButton1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: shootButton1.size.width, height: shootButton1.size.height))
        shootButton1.physicsBody?.affectedByGravity = false
        shootButton1.physicsBody?.isDynamic = false
        shootButton1.physicsBody?.categoryBitMask = Collider.Button
        shootButton1.physicsBody?.collisionBitMask = Collider.Button
        shootButton1.physicsBody?.contactTestBitMask = Collider.EnemySpyro
        self.addChild(shootButton1)
        shootButton2.name = "shootButton"
        shootButton2.alpha = 0.0
        shootButton2.zPosition = 2
        shootButton2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        shootButton2.position = CGPoint(x: 480, y: 0)
        shootButton2.size.width = 1
        shootButton2.size.height = 1334
        shootButton2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: shootButton2.size.width, height: shootButton2.size.height))
        shootButton2.physicsBody?.affectedByGravity = false
        shootButton2.physicsBody?.isDynamic = false
        shootButton2.physicsBody?.categoryBitMask = Collider.Button
        shootButton2.physicsBody?.collisionBitMask = Collider.Button
        shootButton2.physicsBody?.contactTestBitMask = Collider.EnemySpyro
        self.addChild(shootButton2)
    }
    
    func moveBackgrounds() {
        enumerateChildNodes(withName: "BG", using: ({
            (node,stop) in
            node.position.x -= 4.5
            
            if node.position.x < -(self.frame.width) {
                node.position.x += self.frame.width * 3
            }
        }))
        
    }
    
    func displayScore() {
        scoreLabel.zPosition = 5
        scoreLabel.position.x = 420
        scoreLabel.position.y = 310
        scoreLabel.text = "Score: 0"
        self.addChild(scoreLabel)
    }
    
    func displayGameOver() {
        gameOverLabel.zPosition = 15
        gameOverLabel.position.x = 0
        gameOverLabel.position.y = 100
        gameOverLabel.fontSize = 100
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontColor = UIColor.purple
        self.addChild(gameOverLabel)
    }
    
    func displayFinalScore() {
        finalScore = score
        finalScoreLabel.zPosition = 15
        finalScoreLabel.position.x = 0
        finalScoreLabel.position.y = 0
        finalScoreLabel.fontSize = 50
        finalScoreLabel.text = "Final Score: " + "\(finalScore)"
        finalScoreLabel.fontColor = UIColor.purple
        self.addChild(finalScoreLabel)
    }
    
    func displayHighScore() {
        if finalScore > defaults.integer(forKey: "highscore") {
            defaults.set(finalScore, forKey: "highscore")
        }
        highScoreLabel.zPosition = 15
        highScoreLabel.position.x = 0
        highScoreLabel.position.y = -50
        highScoreLabel.fontSize = 50
        highScoreLabel.text = "High Score: " + "\(defaults.integer(forKey: "highscore"))"
        highScoreLabel.fontColor = UIColor.purple
        self.addChild(highScoreLabel)
    }
    
    func displayRetry() {
        retryLabel.zPosition = 15
        retryLabel.position.x = 0
        retryLabel.position.y = -160
        retryLabel.fontSize = 80
        retryLabel.text = "Retry"
        retryLabel.fontColor = UIColor.purple
        self.addChild(retryLabel)
        retryButton.name = "retryButton"
        retryButton.alpha = 0.0
        retryButton.zPosition = 0
        retryButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        retryButton.position.x = 0
        retryButton.position.y = -160
        retryButton.size.width = self.size.width/2
        retryButton.size.height = 100
        retryButton.physicsBody = SKPhysicsBody()
        retryButton.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: retryButton.size.width, height: retryButton.size.height))
        retryButton.physicsBody?.affectedByGravity = false
        retryButton.physicsBody?.isDynamic = false
        retryButton.physicsBody?.categoryBitMask = Collider.Button
        retryButton.physicsBody?.collisionBitMask = Collider.Button
        self.addChild(retryButton)
    }
    
    func displayCharacterSelect() {
        characterSelectLabel.zPosition = 15
        characterSelectLabel.position.x = 0
        characterSelectLabel.position.y = -275
        characterSelectLabel.fontSize = 80
        characterSelectLabel.text = "Character Select"
        characterSelectLabel.fontColor = UIColor.purple
        self.addChild(characterSelectLabel)
        characterSelectButton.name = "characterSelectButton"
        characterSelectButton.alpha = 0.0
        characterSelectButton.zPosition = 0
        characterSelectButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterSelectButton.position.x = 0
        characterSelectButton.position.y = -275
        characterSelectButton.size.width = self.size.width/2
        characterSelectButton.size.height = 100
        characterSelectButton.physicsBody = SKPhysicsBody()
        characterSelectButton.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: characterSelectButton.size.width, height: characterSelectButton.size.height))
        characterSelectButton.physicsBody?.affectedByGravity = false
        characterSelectButton.physicsBody?.isDynamic = false
        characterSelectButton.physicsBody?.categoryBitMask = Collider.Button
        characterSelectButton.physicsBody?.collisionBitMask = Collider.Button
        self.addChild(characterSelectButton)
    }
    
    func displayLives() {
        life1.zPosition = 1
        life1.name = "full"
        life1.texture = fullLife
        life1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        life1.position.x = -600
        life1.position.y = 310
        life1.size.width = 50
        life1.size.height = 50
        self.addChild(life1)
        life2.zPosition = 1
        life2.name = "full"
        life2.texture = fullLife
        life2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        life2.position.x = -550
        life2.position.y = 310
        life2.size.width = 50
        life2.size.height = 50
        self.addChild(life2)
        life3.zPosition = 1
        life3.name = "full"
        life3.texture = fullLife
        life3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        life3.position.x = -500
        life3.position.y = 310
        life3.size.width = 50
        life3.size.height = 50
        self.addChild(life3)
    }
    
    func incrementScore() {
        let delay = SKAction.wait(forDuration: 0.015)
        let incrementScore = SKAction.run ({
            self.score = self.score + 1
            self.scoreLabel.text = "Score: \(self.score)"
        })
        self.run(SKAction.repeatForever(SKAction.sequence([delay,incrementScore])))
    }
    
    func setCharacter() {
        if defaults.integer(forKey: "character") == character.classic {
            spyro.setTexture(texture: spyroTexture)
        }
        else if defaults.integer(forKey: "character") == character.fire {
            spyro.setTexture(texture: fireSpyroTexture)
        }
        else if defaults.integer(forKey: "character") == character.black {
            spyro.setTexture(texture: blackSpyroTexture)
        }
        else if defaults.integer(forKey: "character") == character.skye {
            spyro.setTexture(texture: skyeSpyroTexture)
        }
        else {
            spyro.setTexture(texture: spyroTexture)
        }
    }
    
    
    
}

