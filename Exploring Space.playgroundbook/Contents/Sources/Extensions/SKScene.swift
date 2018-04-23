//
//  SKScene.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

extension SKScene {
    
    public func bigbang(count: Int, minX: Int, minY: Int, maxX: Int, maxY: Int) {
        for _ in 0 ..< count {
            // Select random values for the new star position and opacity
            let x = Int.random(min: minX, max: maxX)
            let y = Int.random(min: minY, max: maxY)
            let alpha = CGFloat.random(min: 0.0, max: 1.0)
            
            let star = Star()
            star.position = CGPoint(x: x, y: y)
            star.alpha = alpha
            
            addChild(star)
        }
    }
    
    public func newExplosion(at position: CGPoint) {
        // Load the explosion particle
        guard let explosion = SKEmitterNode(fileNamed: "Explosion.sks") else {
            fatalError("File for explosion not found")
        }
        
        // Add the explosion to the scene at the specified location
        explosion.position = position
        addChild(explosion)
    }
    
    public func finalFireworks() {
        guard let firework = SKEmitterNode(fileNamed: "Firework.sks") else {
            fatalError("File for fireworks not found")
        }
        firework.position = CGPoint.zero
        firework.zPosition = ZPosition.fireworks.rawValue
        firework.particleTexture = Textures.whiteMaleFace
        
        let fireworkUR = firework.copy() as! SKEmitterNode
        fireworkUR.particleTexture = Textures.whiteFemaleFace
        
        let fireworkDL = firework.copy() as! SKEmitterNode
        fireworkDL.particleTexture = Textures.blackMaleFace
        
        let fireworkDR = firework.copy() as! SKEmitterNode
        fireworkDR.particleTexture = Textures.blackFemaleFace
        
        addChild(firework)
        addChild(fireworkUR)
        addChild(fireworkDL)
        addChild(fireworkDR)
        
        let wwdcLabel = SKLabelNode(fontNamed: "Menlo-Bold")
        wwdcLabel.text = "WWDC18"
        wwdcLabel.zPosition = ZPosition.fireworks.rawValue
        wwdcLabel.position = CGPoint.zero
        wwdcLabel.fontSize = 100
        wwdcLabel.setScale(0)
        wwdcLabel.run(SKAction.scale(to: 1, duration: 2.5))
        addChild(wwdcLabel)
    }
    
}
