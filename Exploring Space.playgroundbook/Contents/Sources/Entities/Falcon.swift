//
//  Falcon.swift
//  Test
//
//  Created by Francesco Chiusolo on 23/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class Falcon: SKSpriteNode {
    
    public init() {
        let texture = Textures.falcon
        let textureSize = texture.size()
        super.init(texture: texture, color: UIColor.clear, size: textureSize)
        
        zPosition = ZPosition.mainActor.rawValue
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.mass = 20.0
        physicsBody?.restitution = 0.0
        physicsBody?.categoryBitMask = BitmaskCategories.falcon.rawValue
        physicsBody?.contactTestBitMask = BitmaskCategories.earth.rawValue
        physicsBody?.collisionBitMask = BitmaskCategories.earth.rawValue
        
        addSpark()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
