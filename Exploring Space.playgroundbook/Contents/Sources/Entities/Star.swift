//
//  Star.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class Star: SKSpriteNode {

    public init() {
        let texture = Textures.star
        let textureSize = texture.size()
        super.init(texture: texture, color: UIColor.clear, size: textureSize)
        
        zPosition = ZPosition.background.rawValue
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
