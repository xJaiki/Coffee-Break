
//
//  GameScene.swift
//  CoffeeBreakDemo1
//
//  Created by Mario Di Marino on 05/04/21.
//

import Foundation
import SpriteKit
import AVFoundation



public class NightTheme: SKScene, SKPhysicsContactDelegate{
    //let rectangle = SKSpriteNode(color: SKColor.cyan, size: CGSize(width: 750, height: 300))
    let checkflag = SKSpriteNode(imageNamed: "checkflag")
    let copen = SKSpriteNode(imageNamed: "copen")
    let copenCategory: UInt32 = 1
    let conoCategory: UInt32 = 2
    let recCategory: UInt32 = 3
    let coin1Category: UInt32 = 4
    let coin2Category: UInt32 = 5
    let coin3Category: UInt32 = 6
    let coinDebugCategory: UInt32 = 7
    let arrowDx = SKSpriteNode(imageNamed: "arrow white")
    let arrowDxBug = SKShapeNode(rectOf: CGSize(width: 230, height: 250))
    let arrowSx = SKSpriteNode(imageNamed: "arrow white")
    let arrowSxBug = SKShapeNode(rectOf: CGSize(width: 230, height: 250))
    let background = SKSpriteNode(imageNamed: "asphaltNight")
    let front = SKSpriteNode(color: .red, size: CGSize(width: 25, height: 25))
    var leftPressed = false
    var rightPressed = false
    let copenRotateSpeed = 0.05
    let valore = 90
    var gameOver = false
    var gameWin = false
    var win = false
    var hit = false
    
    var coin1bugFix = false
    let coin1 = SKSpriteNode(imageNamed: "coin")
    let coin2 = SKSpriteNode(imageNamed: "coin")
    let coin3 = SKSpriteNode(imageNamed: "coin")
    let coinDebug = SKSpriteNode(imageNamed: "coin")
    var coinCounter = 0
    
    let darkness = SKShapeNode(rectOf: CGSize(width: 750, height: 1334))
    let lights = SKSpriteNode(imageNamed: "fari")
    let lightsCrop = SKCropNode()
    
    let triggerWin = SKSpriteNode(color: SKColor.red, size: CGSize(width: 750, height: 2))
    
    let circle = SKShapeNode(circleOfRadius: 100*2)
    
//      public func generateMaskNode(from mask:SKNode) -> SKNode
//      {
//          var returningNode : SKNode!
//          autoreleasepool
//          {
//              let view = SKView()
//              //First let's flatten the node
//              let texture = view.texture(from: mask) 
//              let node = SKSpriteNode(texture:texture) 
//              //Next apply the shader to the flattened node to allow for color swapping
//              node.shader = SKShader(fileNamed: "shader.fsh")
//              let texture2 = view.texture(from: node)
//              returningNode = SKSpriteNode(texture:texture2)
//              
//          }
//          return returningNode
//      }
    
    public override func didMove(to view: SKView) {
        darkness.zPosition = 3
//          darkness.position = CGPoint(x:0,y:300)
        darkness.fillColor = UIColor.black
        darkness.strokeColor = UIColor.black
//          scene?.addChild(darkness)
        
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        arrowDx.alpha = 0.8
        arrowDxBug.alpha = 0.001
        arrowDxBug.fillColor = UIColor.white
        arrowSx.alpha = 0.8
        arrowSxBug.alpha = 0.001
        arrowSxBug.fillColor = UIColor.white
        scene?.addChild(background)
        
        
        physicsWorld.contactDelegate = self
        //        MARK: dahiatsu copen
        
        copen.name  = "copen"
        copen.position = CGPoint(x: 0, y: -590)
        copen.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        copen.size = CGSize(width: 86, height: 136)
        copen.physicsBody = SKPhysicsBody(texture: copen.texture!, size: copen.texture!.size())
        copen.physicsBody?.friction = 0
        copen.physicsBody?.affectedByGravity = false
        copen.physicsBody?.isDynamic = true
        copen.zPosition = 98
        copen.physicsBody?.categoryBitMask = copenCategory
        copen.physicsBody?.contactTestBitMask = conoCategory + recCategory
        scene?.addChild(copen)
        
//          self.backgroundColor = .red
        
        
        //Our transparent overlay
        let fullScreen = SKSpriteNode(color: .black, size: self.size)
        fullScreen.position = CGPoint.zero
        fullScreen.zPosition = 96
        fullScreen.alpha = 1
        
        //let's make a mask to punch circles in our shape
        let mask = SKSpriteNode(color: .white, size: self.size)
        mask.position = CGPoint.zero
        mask.zPosition = 96
        mask.alpha = 1
        
        
        circle.fillColor = .white
        circle.lineWidth = 0
//          circle.position = CGPoint(x:0,y:250)
        circle.alpha = 0.001
        
        //let circle_mask = SKSpriteNode()
        circle.blendMode = .replace
        mask.addChild(circle) 
        
        //let's create the node to place on screen
        let crop = SKCropNode()
        crop.zPosition = 97
        crop.maskNode = mask
        crop.addChild(fullScreen)
        scene?.addChild(crop)
        
        
//          lights.zPosition = 98
//          lights.blendMode = .subtract
//          lights.position = CGPoint(x:0,y:135)
//          copen.addChild(lights)
//          lightsCrop.maskNode=background
//          scene?.addChild(lightsCrop)
        
        
        
//          lightsCrop.addChild(lights)
        
        //        MARK: HUD
        arrowDx.position = CGPoint(x: -230, y: -450)
        arrowDxBug.position = CGPoint(x: -230, y: -450)
        arrowDxBug.name = "arrowDx"
        arrowDx.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        arrowDx.size = CGSize(width: 230, height: 350)
        arrowDx.xScale = -1
        arrowDx.zPosition = 99
        arrowDxBug.zPosition = 99 
        scene?.addChild(arrowDx)
        crop.addChild(arrowDxBug)
        
        
        arrowSx.position = CGPoint(x: 230, y: -450)
        arrowSxBug.position = CGPoint(x: 230, y: -450)
        arrowSxBug.name = "arrowSx"
        arrowSx.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        arrowSx.size = CGSize(width: 230, height: 350)
        arrowSx.zPosition = 99
        arrowSxBug.zPosition = 99 
        scene?.addChild(arrowSx)
        crop.addChild(arrowSxBug)
        
        checkflag.position = CGPoint(x: 0, y: 540)
        checkflag.zPosition = -1
        checkflag.physicsBody?.categoryBitMask = recCategory
        checkflag.physicsBody?.contactTestBitMask = copenCategory
        scene?.addChild(checkflag)
        
        triggerWin.position = CGPoint(x:0, y:520)
        triggerWin.name = "trigger"
        triggerWin.alpha = 0
        triggerWin.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 750, height: 2))
        triggerWin.physicsBody?.affectedByGravity = false
        triggerWin.physicsBody?.categoryBitMask = recCategory
        triggerWin.physicsBody?.contactTestBitMask = copenCategory
        scene?.addChild(triggerWin)
        //         MARK: SPAWN DEI CONI
        spawnCono3()
    }
    
    //        MARK: COLLISION DETECTION
    public func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        var thirdBody: SKPhysicsBody
        if hit == false {
            if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
                firstBody = contact.bodyA
                secondBody = contact.bodyB
            }else{
                firstBody = contact.bodyB
                secondBody = contact.bodyA
            }
            //MARK: gameOer
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == conoCategory) && (hit == false){
                gameOver = true
                copen.zPosition=98
                let overRec = SKShapeNode(rectOf: CGSize(width: 400, height: 300), cornerRadius: 50)
                overRec.fillColor = UIColor.black
                overRec.zPosition=99
                let overLabel = SKLabelNode()
                overLabel.text = "Game Over"
                overLabel.fontSize = 65
                overLabel.fontColor = UIColor.red
                overLabel.position = CGPoint(x: 0, y: 50)
                overLabel.zPosition = 99
                let scoreText = SKLabelNode()
                scoreText.text = "Try another theme!"
                scoreText.fontSize = 40
                scoreText.position = CGPoint(x:0,y:-50)
                scoreText.zPosition = 100
                self.addChild(overRec)
                overRec.addChild(scoreText)
                overRec.addChild(overLabel)
                hit = true
                scene?.run(SKAction.playSoundFileNamed("fail", waitForCompletion: true))
                scene?.run(SKAction.playSoundFileNamed("bonk", waitForCompletion: true))
                
            }
            //MARK: gameWin
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == recCategory){
                let winRec = SKShapeNode(rectOf: CGSize(width: 400, height: 300), cornerRadius: 50)
                winRec.fillColor = UIColor.black
                winRec.zPosition=99
                let scoreText = SKLabelNode()
                scoreText.text = "Coins:"
                scoreText.fontSize = 45
                scoreText.position = CGPoint(x:0,y:-50)
                scoreText.zPosition = 100
                let scoreLabel  = SKLabelNode()
                scoreLabel.text = "\(coinCounter) / 3"
                scoreLabel.fontSize = 45
                scoreLabel.position = CGPoint(x:0,y:-100)
                scoreLabel.zPosition = 100
                let winLabel = SKLabelNode()
                winLabel.position = CGPoint(x:0,y:50)
                winLabel.text = "You won!!"
                winLabel.fontSize = 75
                winLabel.fontColor = UIColor.green
                winLabel.zPosition = 99
                self.addChild(winRec)
                winRec.addChild(scoreLabel)
                winRec.addChild(scoreText)
                winRec.addChild(winLabel)
                scene?.run(SKAction.playSoundFileNamed("win", waitForCompletion: true))
                hit = true
                arrowDx.removeFromParent()
                arrowSx.removeFromParent()
                if coinCounter>3 {
                    coinCounter = 3
                }
            }
            
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == coinDebugCategory){
                print("toccato debug")
                coinDebug.removeFromParent()
            }
            
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == coin1Category){
                coinCounter+=1
                scene?.run(SKAction.playSoundFileNamed("coinSound", waitForCompletion: true))
                coin1.removeFromParent()
                print("toccato 1")
            }
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == coin2Category){
                coinCounter+=1
                scene?.run(SKAction.playSoundFileNamed("coinSound", waitForCompletion: true))
                coin2.removeFromParent()
                print("toccato 2")
            }
            if (firstBody.categoryBitMask == copenCategory) && (secondBody.categoryBitMask == coin3Category){
                coinCounter+=1
                coin3.removeFromParent()
                scene?.run(SKAction.playSoundFileNamed("coinSound", waitForCompletion: true))
                print("toccato 3")
            }
            //              if (coin1bugFix == true) {
            //                  coinCounter-=1
            //                  coin1bugFix = false
            //              }
        }
        
        //          if ((firstBody.categoryBitMask & copenCategory != 0) && (secondBody.categoryBitMask & conoCategory != 0)) 
        //              gameOver = true
        //          }else if ((firstBody.categoryBitMask & copenCategory != 0) && (secondBody.categoryBitMask & recCategory != 0)) {
        //              let winLabel = SKLabelNode()
        //              winLabel.position = CGPoint(x:0.5,y:0.5)
        //              winLabel.text = "ciao"
        //              self.addChild(winLabel)
        //          }
        
    }
    
    public func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
    //    MARK: CONI
    func spawnCono3(){
        let textureA = SKTexture(imageNamed: "cono")
        //          let textureB = SKTexture(imageNamed: "coin")
        coin1.position = CGPoint(x: 200, y: -100)
        coin1.size = CGSize(width: 40, height: 40)
        coin1.physicsBody = SKPhysicsBody(texture: coin1.texture!, size: CGSize(width: 40, height: 40))
        coin1.physicsBody?.affectedByGravity = false
        coin1.physicsBody?.isDynamic = true
        coin1.physicsBody?.categoryBitMask = coin1Category
        coin1.physicsBody?.contactTestBitMask = copenCategory
        coin1.physicsBody?.friction = 1
        
        coin2.position = CGPoint(x: 0, y: 300)
        coin2.size = CGSize(width: 40, height: 40)
        coin2.physicsBody = SKPhysicsBody(texture: coin1.texture!, size: CGSize(width: 40, height: 40))
        coin2.physicsBody?.affectedByGravity = false
        coin2.physicsBody?.isDynamic = true
        coin2.physicsBody?.categoryBitMask = coin2Category
        coin2.physicsBody?.contactTestBitMask = copenCategory
        coin2.physicsBody?.friction = 1
        
        coin3.position = CGPoint(x: -150, y: 200)
        coin3.size = CGSize(width: 40, height: 40)
        coin3.physicsBody = SKPhysicsBody(texture: coin1.texture!, size: CGSize(width: 40, height: 40))
        coin3.physicsBody?.affectedByGravity = false
        coin3.physicsBody?.isDynamic = true
        coin3.physicsBody?.categoryBitMask = coin3Category
        coin3.physicsBody?.contactTestBitMask = copenCategory
        coin3.physicsBody?.friction = 1
        
        coinDebug.position = CGPoint(x: 0, y: -500)
        coinDebug.size = CGSize(width: 40, height: 40)
        coinDebug.physicsBody = SKPhysicsBody(texture: coin1.texture!, size: CGSize(width: 40, height: 40))
        coinDebug.physicsBody?.affectedByGravity = false
        coinDebug.physicsBody?.isDynamic = true
        coinDebug.physicsBody?.categoryBitMask = coinDebugCategory
        coinDebug.physicsBody?.contactTestBitMask = copenCategory
        coinDebug.physicsBody?.friction = 1
        
        scene?.addChild(coin1)
        scene?.addChild(coin2)
        scene?.addChild(coin3)
        scene?.addChild(coinDebug)
        
        let cono = SKSpriteNode(texture: textureA)
        let cono1 = cono.copy() as! SKSpriteNode
        let cono2 = cono.copy() as! SKSpriteNode
        let cono3 = cono.copy() as! SKSpriteNode
        let cono4 = cono.copy() as! SKSpriteNode
        let cono5 = cono.copy() as! SKSpriteNode
        let cono6 = cono.copy() as! SKSpriteNode
        let cono7 = cono.copy() as! SKSpriteNode
        let cono8 = cono.copy() as! SKSpriteNode
        let cono9 = cono.copy() as! SKSpriteNode
        let cono10 = cono.copy() as! SKSpriteNode
        
        cono.position = CGPoint(x: -30, y: -100)
        cono.size = CGSize(width: 40, height: 40)
        cono.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono.physicsBody?.affectedByGravity = false
        cono.physicsBody?.isDynamic = true
        cono.physicsBody?.categoryBitMask = conoCategory
        cono.physicsBody?.contactTestBitMask = copenCategory
        cono.physicsBody?.friction = 1
        
        cono1.position = CGPoint(x: 100, y: -30)
        cono1.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono1.physicsBody?.affectedByGravity = false
        cono1.physicsBody?.isDynamic = true
        cono1.physicsBody?.categoryBitMask = conoCategory
        cono1.physicsBody?.contactTestBitMask = copenCategory
        cono1.physicsBody?.friction = 1
        
        cono2.position = CGPoint(x: 285, y: -23)
        cono2.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono2.physicsBody?.affectedByGravity = false
        cono2.physicsBody?.isDynamic = true
        cono2.physicsBody?.categoryBitMask = conoCategory
        cono2.physicsBody?.contactTestBitMask = copenCategory
        cono2.physicsBody?.friction = 1
        
        cono3.position = CGPoint(x: 180, y: 60)
        cono3.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono3.physicsBody?.affectedByGravity = false
        cono3.physicsBody?.isDynamic = true
        cono3.physicsBody?.categoryBitMask = conoCategory
        cono3.physicsBody?.contactTestBitMask = copenCategory
        cono3.physicsBody?.friction = 1
        
        cono4.position = CGPoint(x: -180, y: 40)
        cono4.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono4.physicsBody?.affectedByGravity = false
        cono4.physicsBody?.isDynamic = true
        cono4.physicsBody?.categoryBitMask = conoCategory
        cono4.physicsBody?.contactTestBitMask = copenCategory
        cono4.physicsBody?.friction = 1
        
        cono5.position = CGPoint(x: -280, y: -30)
        cono5.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono5.physicsBody?.affectedByGravity = false
        cono5.physicsBody?.isDynamic = true
        cono5.physicsBody?.categoryBitMask = conoCategory
        cono5.physicsBody?.contactTestBitMask = copenCategory
        cono5.physicsBody?.friction = 1
        
        cono5.position = CGPoint(x: -50, y: 150)
        cono5.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono5.physicsBody?.affectedByGravity = false
        cono5.physicsBody?.isDynamic = true
        cono5.physicsBody?.categoryBitMask = conoCategory
        cono5.physicsBody?.contactTestBitMask = copenCategory
        cono5.physicsBody?.friction = 1
        
        cono6.position = CGPoint(x: -300, y: -60)
        cono6.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono6.physicsBody?.affectedByGravity = false
        cono6.physicsBody?.isDynamic = true
        cono6.physicsBody?.categoryBitMask = conoCategory
        cono6.physicsBody?.contactTestBitMask = copenCategory
        cono6.physicsBody?.friction = 1
        
        cono7.position = CGPoint(x: -270, y: 200)
        cono7.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono7.physicsBody?.affectedByGravity = false
        cono7.physicsBody?.isDynamic = true
        cono7.physicsBody?.categoryBitMask = conoCategory
        cono7.physicsBody?.contactTestBitMask = copenCategory
        cono7.physicsBody?.friction = 1
        
        cono8.position = CGPoint(x: 270, y: 230)
        cono8.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono8.physicsBody?.affectedByGravity = false
        cono8.physicsBody?.isDynamic = true
        cono8.physicsBody?.categoryBitMask = conoCategory
        cono8.physicsBody?.contactTestBitMask = copenCategory
        cono8.physicsBody?.friction = 1
        
        cono9.position = CGPoint(x: 120, y: 260)
        cono9.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
        cono9.physicsBody?.affectedByGravity = false
        cono9.physicsBody?.isDynamic = true
        cono9.physicsBody?.categoryBitMask = conoCategory
        cono9.physicsBody?.contactTestBitMask = copenCategory
        cono9.physicsBody?.friction = 1
        
                scene?.addChild(cono)
                scene?.addChild(cono1)
                scene?.addChild(cono2)
                scene?.addChild(cono3)
                scene?.addChild(cono4)
                scene?.addChild(cono5)
                scene?.addChild(cono6)
                scene?.addChild(cono7)
                scene?.addChild(cono8)
                scene?.addChild(cono9)
        //          scene?.addChild(cono10)
    }
    func spawnCono2(){
        
    }
    func spawnCono1(){
        for _ in 1...17{
            let textureA = SKTexture(imageNamed: "cono")
            let cono = SKSpriteNode(texture: textureA)
            cono.size = CGSize(width: 40, height: 40)
            
            cono.physicsBody = SKPhysicsBody(texture: cono.texture!, size: cono.texture!.size())
            cono.position = CGPoint(x:Int.random(in: -360...360) ,y: Int.random(in: -160...310))
            cono.physicsBody?.affectedByGravity = false
            cono.physicsBody?.isDynamic = true
            cono.physicsBody?.categoryBitMask = conoCategory
            cono.physicsBody?.contactTestBitMask = copenCategory
            cono.physicsBody?.friction = 1
            //            cono.physicsBody?.collisionBitMask = conoCategory
            scene?.addChild(cono)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        let node = self.atPoint(touchLocation)
        if (node.name == "arrowDx") {
            copen.zRotation += CGFloat(copenRotateSpeed*8)
            
            print("destra")
        } else if (node.name == "arrowSx"){
            copen.zRotation -= CGFloat(copenRotateSpeed*8)
            
            print("sinistra")
        }
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        // MARK: score
        //          frameCounter+=1
        //          if(frameCounter==50){
        //              score+=10
        //              scoreLabel.text = "\(score)"
        //              frameCounter=0
        //          }
        //        MARK: DESTRA E SINISTRA
        //          if (leftPressed){
        //              copen.zRotation += CGFloat(copenRotateSpeed)
        //          } else if (rightPressed){
        //              copen.zRotation -= CGFloat(copenRotateSpeed)
        //          }
        //        MARK: VELOCITA
        let dx = 200*(-sin(copen.zRotation))
        let dy = 200*(cos(copen.zRotation))
        //        MARK: GAMEOVER
        if (gameOver == false) {
            copen.physicsBody?.velocity = CGVector(dx: dx,dy: dy)
        } else if (gameOver == true) {
            copen.physicsBody?.velocity = CGVector(dx: 0,dy: 0)
            copen.zRotation -= CGFloat(copenRotateSpeed)
            arrowDx.removeFromParent()
            arrowSx.removeFromParent()
        }
        
        circle.position = CGPoint(x:copen.position.x,y:copen.position.y)
        
        //        MARK: WIN
        //if Int(copen.position.y)>520{
        //copen.physicsBody?.velocity = CGVector(dx: 0,dy: 0)
        //arrowDx.removeFromParent()
        //arrowSx.removeFromParent()
        //win = true
        //}
    }
    
    //      public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //          let touch = touches.first
    //          let touchLocation = touch!.location(in: self)
    //          let node = self.atPoint(touchLocation)
    //          if (node.name == "arrowDx") {
    //              leftPressed = false
    //          }
    //          if (node.name == "arrowSx") {
    //              rightPressed = false
    //          }
    //          
    //      }
}
