//
//  ZombieNode.swift
//  Zombiemoji
//
//  Created by Luiz Carlos da Silva Araujo on 06/08/21.
//              Factory of Zombies
//

import Foundation
import SpriteKit

class ZombieNode: SKSpriteNode {
    
    private var zombieTextureAtlas = SKTextureAtlas()
    private var zombieSex   = TypeOfZombie.male
    private var zombieScore = 0
    private var zombieHP    = 100.0
    private var zombieSize  = CGSize(width: 90.0, height: 100.0)
    
    var zombieAnimations = [
        "zombie_Attack": [SKTexture](),
        "zombie_Dead"  : [SKTexture](),
        "zombie_Idle"  : [SKTexture](),
        "zombie_Walk"  : [SKTexture]()
    ]
    
    
    init(sex: TypeOfZombie = TypeOfZombie.male, size: CGSize = CGSize(width: 90.0, height: 100.0)){
        
        self.zombieSex  = sex
        self.zombieSize = size
        
        super.init(texture: nil, color: .clear, size: self.zombieSize)
        
        self.zombieAnimations["zombie_Idle"]   = createAnimationsSprites(sex: TypeOfZombie.male, nameOfAtlas: "zombie_Idle", nameOfAnimation: "Idle")
        self.zombieAnimations["zombie_Walk"]   = createAnimationsSprites(sex: TypeOfZombie.male, nameOfAtlas: "zombie_Walk", nameOfAnimation: "Walk")
        self.zombieAnimations["zombie_Attack"] = createAnimationsSprites(sex: TypeOfZombie.male, nameOfAtlas: "zombie_Attack", nameOfAnimation: "Attack")
        self.zombieAnimations["zombie_Dead"]   = createAnimationsSprites(sex: TypeOfZombie.male, nameOfAtlas: "zombie_Dead", nameOfAnimation: "Dead")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     Setter & Getters
     */
    
    func setZombieSex(sex: TypeOfZombie){
        self.zombieSex = sex
    }
    func setZombieScore(score: Int){
        self.zombieScore = score
    }
    func setZombieHP(hp: Double){
        self.zombieHP = hp
    }
    func setZombieSize(size: CGSize){
        self.zombieSize = size
    }
    func setZombieAnimations(texture: [String: [SKTexture]]){
        self.zombieAnimations = texture
    }

    func getZombieSex() -> TypeOfZombie {
       return self.zombieSex
    }
    func getZombieScore() -> Int {
       return self.zombieScore
    }
    func getZombieHP() -> Double{
       return self.zombieHP
    }
    func getZombieSize() -> CGSize{
       return self.zombieSize
    }
//    func getZombieAnimations(texture: St) -> [String: [SKTexture]] {
//       return self.zombieAnimations
//    }
   
    
    func createAnimationsSprites(sex: TypeOfZombie, nameOfAtlas: String, nameOfAnimation: String) -> [SKTexture] {
        var arrayOfTexture = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: nameOfAtlas)
        
        for index in 1...textureAtlas.textureNames.count {
            let textureName = nameOfAnimation + String(index)
            arrayOfTexture.append(textureAtlas.textureNamed(textureName))
        }
        
        return arrayOfTexture
    }
    
    
//    func setZombieAnimation(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
    
}//end class
