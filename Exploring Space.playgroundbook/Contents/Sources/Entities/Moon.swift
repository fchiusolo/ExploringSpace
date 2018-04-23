//
//  Moon.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class Moon: SKSpriteNode {
    
    public var gravityRadius: CGFloat {
        return max(size.width * 2, size.height * 2)
    }
    
    public init() {
        let texture = Textures.moon
        let textureSize = texture.size()
        super.init(texture: texture, color: UIColor.clear, size: textureSize)
        
        zPosition = ZPosition.foreground.rawValue
        
        physicsBody = SKPhysicsBody(circleOfRadius: max(size.width / 2, size.height / 2))
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = BitmaskCategories.moon.rawValue
        
        let moonAtmosphere = SKNode()
        moonAtmosphere.position = CGPoint(x: 0, y: 0)
        moonAtmosphere.physicsBody = SKPhysicsBody(circleOfRadius: max(size.width * 2, size.height * 2))
        moonAtmosphere.physicsBody?.isDynamic = false
        moonAtmosphere.physicsBody?.categoryBitMask = BitmaskCategories.moonAtmosphere.rawValue
        
        let moonGravity = SKFieldNode.radialGravityField()
        moonGravity.strength = 0.5
        moonAtmosphere.addChild(moonGravity)
        
        addChild(moonAtmosphere)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
