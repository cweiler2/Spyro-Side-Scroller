//
//  CharacterSelectScene.swift
//  Spyro
//
//  Created by Cody Weiler on 2/5/18.
//  Copyright © 2018 Cody Weiler. All rights reserved.
//

import SpriteKit

class CharacterScene: SKScene {
    
    let background = SKSpriteNode()

    let spyro = SKSpriteNode(imageNamed: "spyro")
    let darkSpyro = SKSpriteNode(imageNamed: "blackspyro")
    let fireSpyro = SKSpriteNode(imageNamed: "firespyro")
    let skyeSpyro = SKSpriteNode(imageNamed: "skye")
    let buttonSpyro = SKSpriteNode()
    let buttonDarkSpyro = SKSpriteNode()
    let buttonFireSpyro = SKSpriteNode()
    let buttonSkyeSpyro = SKSpriteNode()
    
    let selectTexture = SKTexture(imageNamed: "select")
    let lockTexture = SKTexture(imageNamed: "lock")
    
    let fireSpyroLock = SKSpriteNode()
    let blackSpyroLock = SKSpriteNode()
    let skyeSpyroLock = SKSpriteNode()
    
    let fireSpyroLockLabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    let blackSpyroLockLabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    let skyeSpyroLockLabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    
    let defaults = UserDefaults.standard
    
    let characterSelectLabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    
    struct character {
        static let classic: UInt32 = 1
        static let fire: UInt32 = 2
        static let black: UInt32 = 3
        static let skye: UInt32 = 4
    }
    
    override func didMove(to view: SKView) {
        initialize()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let highscore = defaults.integer(forKey: "highscore")
            if buttonSpyro.contains(location) {
                defaults.set(character.classic, forKey: "character")
                let gameScene = GameScene(fileNamed: "GameScene")
                gameScene!.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
            }
            else if buttonFireSpyro.contains(location) && (highscore >= 25000) {
                defaults.set(character.fire, forKey: "character")
                let gameScene = GameScene(fileNamed: "GameScene")
                gameScene!.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
            }
            else if buttonDarkSpyro.contains(location) && (highscore >= 35000) {
                defaults.set(character.black, forKey: "character")
                let gameScene = GameScene(fileNamed: "GameScene")
                gameScene!.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
            }
            else if buttonSkyeSpyro.contains(location) && (highscore >= 55000){
                defaults.set(character.skye, forKey: "character")
                let gameScene = GameScene(fileNamed: "GameScene")
                gameScene!.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
            }
        }
    }
    
    func initialize() {
        let highscore = defaults.integer(forKey: "highscore")
        createBackground()
        createCharacterButtons()
        createCharacterSelectLabel()
        if highscore < 20000 {
            createFireSpyroLock()
            createBlackSpyroLock()
            createSkyeSpyroLock()
        }
        else if highscore < 35000 {
            createBlackSpyroLock()
            createSkyeSpyroLock()
        }
        else if highscore < 55000 {
            createSkyeSpyroLock()
        }
    }
    
    func createBackground() {
        background.name = "background"
        background.zPosition = 1
        background.color = UIColor.white
        background.size.width = self.size.width
        background.size.height = self.size.height
        self.addChild(background)
    }
    
    func createCharacterButtons() {
        buttonSpyro.name = "buttonSpyro"
        buttonSpyro.texture = selectTexture
        buttonSpyro.zPosition = 3
        buttonSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonSpyro.size.width = self.size.width/2
        buttonSpyro.size.height = self.size.height/2 - 60
        buttonSpyro.position.x = -320
        buttonSpyro.position.y = 100
        spyro.name = "spyro"
        spyro.zPosition = 3
        spyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        spyro.size.width = 200
        spyro.size.height = 150
        spyro.position.x = -320
        spyro.position.y = 100
        self.addChild(buttonSpyro)
        self.addChild(spyro)
        buttonDarkSpyro.name = "buttonDarkSpyro"
        buttonDarkSpyro.texture = selectTexture
        buttonDarkSpyro.zPosition = 3
        buttonDarkSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonDarkSpyro.size.width = self.size.width/2
        buttonDarkSpyro.size.height = self.size.height/2 - 60
        buttonDarkSpyro.position.x = -320
        buttonDarkSpyro.position.y = -180
        darkSpyro.name = "darkSpyro"
        darkSpyro.zPosition = 3
        darkSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        darkSpyro.size.width = 200
        darkSpyro.size.height = 150
        darkSpyro.position.x = -320
        darkSpyro.position.y = -180
        self.addChild(buttonDarkSpyro)
        self.addChild(darkSpyro)
        buttonFireSpyro.name = "buttonFireSpyro"
        buttonFireSpyro.texture = selectTexture
        buttonFireSpyro.zPosition = 3
        buttonFireSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonFireSpyro.size.width = self.size.width/2
        buttonFireSpyro.size.height = self.size.height/2 - 60
        buttonFireSpyro.position.x = 320
        buttonFireSpyro.position.y = 100
        fireSpyro.name = "fireSpyro"
        fireSpyro.zPosition = 3
        fireSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fireSpyro.size.width = 200
        fireSpyro.size.height = 150
        fireSpyro.position.x = 320
        fireSpyro.position.y = 100
        self.addChild(buttonFireSpyro)
        self.addChild(fireSpyro)
        buttonSkyeSpyro.name = "buttonSkyeSpyro"
        buttonSkyeSpyro.texture = selectTexture
        buttonSkyeSpyro.zPosition = 3
        buttonSkyeSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonSkyeSpyro.size.width = self.size.width/2
        buttonSkyeSpyro.size.height = self.size.height/2 - 60
        buttonSkyeSpyro.position.x = 320
        buttonSkyeSpyro.position.y = -180
        skyeSpyro.name = "skyeSpyro"
        skyeSpyro.zPosition = 3
        skyeSpyro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        skyeSpyro.size.width = 200
        skyeSpyro.size.height = 150
        skyeSpyro.position.x = 320
        skyeSpyro.position.y = -180
        self.addChild(buttonSkyeSpyro)
        self.addChild(skyeSpyro)
    }
    
    func createCharacterSelectLabel() {
        characterSelectLabel.text = "Character Select"
        characterSelectLabel.zPosition = 2
        characterSelectLabel.fontSize = 100
        characterSelectLabel.fontColor = UIColor.purple
        characterSelectLabel.position.x = 0
        characterSelectLabel.position.y = 270
        self.addChild(characterSelectLabel)
    }
    
    func createFireSpyroLock() {
        fireSpyroLock.texture = lockTexture
        fireSpyroLock.zPosition = 4
        fireSpyroLock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fireSpyroLock.size.width = 150
        fireSpyroLock.size.height = 150
        fireSpyroLock.position = fireSpyro.position
        self.addChild(fireSpyroLock)
        fireSpyroLockLabel.text = "Earn a highscore of 20000 to unlock"
        fireSpyroLockLabel.zPosition = 4
        fireSpyroLockLabel.fontSize = 30
        fireSpyroLockLabel.fontColor = UIColor.purple
        fireSpyroLockLabel.position.x = 320
        fireSpyroLockLabel.position.y = -5
        self.addChild(fireSpyroLockLabel)
    }
    
    func createBlackSpyroLock() {
        blackSpyroLock.texture = lockTexture
        blackSpyroLock.zPosition = 4
        blackSpyroLock.anchorPoint = CGPoint(x: 0.5, y:0.5)
        blackSpyroLock.size.width = 150
        blackSpyroLock.size.height = 150
        blackSpyroLock.position = darkSpyro.position
        self.addChild(blackSpyroLock)
        blackSpyroLockLabel.text = "Earn a highscore of 35000 to unlock"
        blackSpyroLockLabel.zPosition = 4
        blackSpyroLockLabel.fontSize = 30
        blackSpyroLockLabel.fontColor = UIColor.purple
        blackSpyroLockLabel.position.x = -320
        blackSpyroLockLabel.position.y = -285
        self.addChild(blackSpyroLockLabel)
    }
    
    func createSkyeSpyroLock() {
        skyeSpyroLock.texture = lockTexture
        skyeSpyroLock.zPosition = 4
        skyeSpyroLock.anchorPoint = CGPoint(x: 0.5, y:0.5)
        skyeSpyroLock.size.width = 150
        skyeSpyroLock.size.height = 150
        skyeSpyroLock.position = skyeSpyro.position
        self.addChild(skyeSpyroLock)
        skyeSpyroLockLabel.text = "Earn a highscore of 55000 to unlock"
        skyeSpyroLockLabel.zPosition = 4
        skyeSpyroLockLabel.fontSize = 30
        skyeSpyroLockLabel.fontColor = UIColor.purple
        skyeSpyroLockLabel.position.x = 320
        skyeSpyroLockLabel.position.y = -285
        self.addChild(skyeSpyroLockLabel)
    }
}
