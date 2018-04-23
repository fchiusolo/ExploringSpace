//
//  Earth.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class Earth: SKSpriteNode {

    public init(hasGravityField: Bool, usSide: Bool) {
        let texture = usSide ? Textures.earthUS : Textures.earthURSS
        let textureSize = texture.size()
        super.init(texture: texture, color: UIColor.clear, size: textureSize)
        
        zPosition = ZPosition.foreground.rawValue
        
        physicsBody = SKPhysicsBody(texture: texture, size: textureSize)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = BitmaskCategories.earth.rawValue
        
        if hasGravityField {
            let earthGravity = SKFieldNode.radialGravityField()
            earthGravity.strength = 1
            earthGravity.region = SKRegion(radius: Float(max(size.width, size.height) * 6))
            
            addChild(earthGravity)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
