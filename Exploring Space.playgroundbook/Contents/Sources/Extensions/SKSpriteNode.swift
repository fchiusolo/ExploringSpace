//
//  SKSpriteNode.swift
//  Test
//
//  Created by Francesco Chiusolo on 24/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    static let sparkName = "engine_spark"
    
    public func addSpark() {
        // Load the spark particle
        guard let spark = SKEmitterNode(fileNamed: "Spark.sks") else {
            fatalError("File for spark not found")
        }
        
        // Add the spark to the bottom-center of the sprite
        spark.position = CGPoint(x: 0, y: -size.height / 2)
        spark.name = SKSpriteNode.sparkName
        addChild(spark)
    }
    
    public func removeSpark() {
        if let spark = childNode(withName: SKSpriteNode.sparkName) {
            spark.removeFromParent()
        }
    }
    
}
