//
//  Sputnik.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class Sputnik: SKSpriteNode {
    
    public init() {
        let texture = Textures.sputnik
        let textureSize = texture.size()
        super.init(texture: texture, color: UIColor.clear, size: textureSize)
        
        zPosition = ZPosition.mainActor.rawValue
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.categoryBitMask = BitmaskCategories.rocket.rawValue
        physicsBody?.contactTestBitMask = BitmaskCategories.moonAtmosphere.rawValue
        physicsBody?.collisionBitMask = BitmaskCategories.moon.rawValue | BitmaskCategories.earth.rawValue
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
