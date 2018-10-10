//
//  TitleScene.swift
//  Spyro
//
//  Created by Cody Weiler on 10/11/17.
//  Copyright © 2017 Cody Weiler. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    
    let title = SKSpriteNode(imageNamed: "Title")
    let play = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    let music = SKAudioNode(fileNamed: "spyroSong.mp3")
    
    let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.8)
    let fadeOut = SKAction.fadeAlpha(to: 0.25, duration: 0.8)
    
    override func didMove(to view: SKView) {
        initialize()
        self.addChild(music)
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBackgrounds()
        fadePlayText()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = CharacterScene(fileNamed: "CharacterScene")
        gameScene!.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.doorway(withDuration: 1))
        
    }
    
    func initialize() {
        createBackgrounds()
        createTitle()
        moveBackgrounds()
        createPlayText()
        
    }
    
    func createBackgrounds() {
        for i in 0...2 {
            let bg = SKSpriteNode(imageNamed: "BG")
            bg.name = "BG"
            bg.zPosition = 0
            bg.size.width = 1334
            bg.size.height = 750
            bg.anchorPoint = CGPoint(x:0.5, y:0.5)
            bg.position = CGPoint(x: CGFloat(i) * bg.size.width, y:0)
            self.addChild(bg)
        }
    }
    
    func createTitle() {
        title.name = "Title"
        title.zPosition = 1
        title.size.width = 750
        title.size.height = 400
        title.position.x = -20
        title.position.y = 156.5
        self.addChild(title)
    }
    
    func moveBackgrounds() {
        enumerateChildNodes(withName: "BG", using: ({
            (node,stop) in
            node.position.x -= 2.5
            
            if node.position.x < -(self.frame.width) {
                node.position.x += self.frame.width * 3
            }
        }))
    
    }
    
    func createPlayText() {
        play.text = "Tap anywhere to play!"
        play.fontSize = 85
        play.fontColor = SKColor.white
        play.position = CGPoint(x: 0, y: -200)
        play.zPosition = 1
        play.alpha = 1.0
        self.addChild(play)

    }
    
    func fadePlayText() {
        if play.alpha == 1.0 {
            play.run(fadeOut)
        }
        if play.alpha == 0.25 {
            play.run(fadeIn)
        }
    }
    
    
    
}















