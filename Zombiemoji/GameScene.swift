//
//  GameScene.swift
//  Zombiemoji
//
//  Created by Luiz Carlos da Silva Araujo on 24/07/21.
//

import SpriteKit

class GameScene: SKScene {
    
    let myFirstNode = SKNode()
    let myFirstSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 200.0))
    let blueBox = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 100.0, height: 100.0))
    let myFirstTexturedSpriteNode = SKSpriteNode(imageNamed: "spaceship")
    
//    let zombieSpriteNode = SKSpriteNode(imageNamed: "Idle1")
    
    let zombieSpriteNode = ZombieNode()
    
//    var zombie_Idle   = [SKTexture]()
//    var zombie_Walk   = [SKTexture]()
//    var zombie_Attack = [SKTexture]()
//    var zombie_Dead   = [SKTexture]()
    
    override func didMove(to view: SKView) {
        /*
        myFirstSpriteNode.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        myFirstSpriteNode.position = CGPoint(x: 0, y: 0)
        myFirstSpriteNode.zPosition = 1
        
//        blueBox.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        blueBox.position = CGPoint(x: myFirstSpriteNode.size.width / 2, y: myFirstSpriteNode.size.height / 2)
        blueBox.zPosition = 1
        
        myFirstTexturedSpriteNode.size = CGSize(width: 50.0, height: 100.0)
//        myFirstTexturedSpriteNode.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        myFirstTexturedSpriteNode.position = CGPoint(x: 0, y: 0)
        myFirstTexturedSpriteNode.zPosition = 2
        
        addChild(myFirstNode)
        addChild(myFirstSpriteNode)
        myFirstSpriteNode.addChild(blueBox)
        myFirstSpriteNode.addChild(myFirstTexturedSpriteNode)
        */
         
         
        /*
         Atlas
         */
        
        zombieSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(zombieSpriteNode)
        zombieSpriteNode.size = CGSize(width: 90.0, height: 100.0)
        
        
        
//        self.zombie_Idle   = createAnimationsSprites(nameOfAtlas: "zombie_Idle", nameOfAnimation: "Idle")
//        self.zombie_Walk   = createAnimationsSprites(nameOfAtlas: "zombie_Walk", nameOfAnimation: "Walk")
//        self.zombie_Attack = createAnimationsSprites(nameOfAtlas: "zombie_Attack", nameOfAnimation: "Attack")
//        self.zombie_Dead   = createAnimationsSprites(nameOfAtlas: "zombie_Dead", nameOfAnimation: "Dead")
        
    }
    
//    func createAnimationsSprites(nameOfAtlas: String, nameOfAnimation: String) -> [SKTexture] {
//        var arrayOfTexture = [SKTexture]()
//        let textureAtlas = SKTextureAtlas(named: nameOfAtlas)
//
//        for index in 1...textureAtlas.textureNames.count {
//            let textureName = nameOfAnimation + String(index)
//            arrayOfTexture.append(textureAtlas.textureNamed(textureName))
//        }
//
//        return arrayOfTexture
//    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
//        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: frame.size.width - myFirstTexturedSpriteNode.size.width, y: frame.size.height - myFirstTexturedSpriteNode.size.height), duration: 2.0))
//        blueBox.run(SKAction.rotate(byAngle: Double.pi, duration: 2.0))
        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: frame.size.width - myFirstTexturedSpriteNode.size.width, y: frame.size.height - myFirstTexturedSpriteNode.size.height), duration: 2.0)) {
            self.myFirstTexturedSpriteNode.position = CGPoint.zero
        }
        blueBox.run(SKAction.repeatForever(SKAction.rotate(byAngle: Double.pi, duration: 2.0)))
        
        if !blueBox.hasActions() {
//            blueBox.run(SKAction.repeatForever(SKAction.rotate(byAngle: Double.pi, duration: 2.0)))
//            blueBox.run(SKAction.group([SKAction.repeatForever(SKAction.rotate(byAngle: Double.pi, duration: 2.0)), SKAction.scale(by: 0.9, duration: 2.0)]))
            blueBox.run(SKAction.sequence([SKAction.rotate(byAngle: Double.pi, duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
        } else {
            blueBox.removeAllActions()
        }
        if let _ = myFirstTexturedSpriteNode.action(forKey: "Rotation") {
            myFirstTexturedSpriteNode.removeAllActions()
            myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: frame.size.width - myFirstTexturedSpriteNode.size.width, y: frame.size.height - myFirstTexturedSpriteNode.size.height), duration: 2.0)) {
                self.myFirstTexturedSpriteNode.position = CGPoint.zero
            }
        } else {
            myFirstTexturedSpriteNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: Double.pi, duration: 2.0)), withKey: "Rotation")
        }
         */
        
        if !zombieSpriteNode.hasActions() {
            zombieSpriteNode.run(SKAction.repeatForever((SKAction.animate(with: self.zombieSpriteNode.zombieAnimations["zombie_Idle"]!, timePerFrame: 0.15))), withKey: "zombie_Idle")
        } else {
        
            if let _ = zombieSpriteNode.action(forKey: "zombie_Idle"){
                zombieSpriteNode.removeAllActions()
                zombieSpriteNode.run(SKAction.repeatForever((SKAction.animate(with: self.zombieSpriteNode.zombieAnimations["zombie_Walk"]!, timePerFrame: 0.15))), withKey: "zombie_Walk")
                
            } else {
                if let _ = zombieSpriteNode.action(forKey: "zombie_Walk"){
                    zombieSpriteNode.removeAllActions()
                    zombieSpriteNode.run(SKAction.repeatForever((SKAction.animate(with: self.zombieSpriteNode.zombieAnimations["zombie_Attack"]!, timePerFrame: 0.15))), withKey: "zombie_Attack")
                    
                } else {
                    if let _ = zombieSpriteNode.action(forKey: "zombie_Attack"){
                        zombieSpriteNode.removeAllActions()
                        zombieSpriteNode.run(SKAction.repeatForever((SKAction.animate(with: self.zombieSpriteNode.zombieAnimations["zombie_Dead"]!, timePerFrame: 0.15))), withKey: "zombie_Dead")
                        
                        
                    } else {
                        zombieSpriteNode.removeAllActions()
                        zombieSpriteNode.run(SKAction.repeatForever((SKAction.animate(with: self.zombieSpriteNode.zombieAnimations["zombie_Idle"]!, timePerFrame: 0.15))), withKey: "zombie_Idle")
                        
                    }
                }
            }
        }
    }
    
}
