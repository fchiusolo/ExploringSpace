//
//  GameScene.swift
//  Test
//
//  Created by Francesco Chiusolo on 21/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class ApolloScene: SKScene {
    
    // MARK: - Properties
    
    let myCamera = SKCameraNode()
    
    var earth = Earth(hasGravityField: false, usSide: true)
    
    var moon = Moon()
    
    var rocket = Rocket()
    
    var isRocketInMoonAtmosphere: Bool = false
    
    var rocketConstraintToMoon: SKConstraint!
    
    // MARK: - Scene Lifecycle
    
    public override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        camera = myCamera
        
        earth.position = CGPoint(x: 0, y: 0)
        addChild(earth)
        
        moon.position = CGPoint(x: 1000, y: 1000)
        addChild(moon)
        
        rocketConstraintToMoon = SKConstraint.orient(to: moon, offset: SKRange(constantValue: CGFloat.pi / 2))
        
        bigbang(count: 92, minX: -500, minY: -500, maxX: 2000, maxY: 2000)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if isRocketInMoonAtmosphere, rocket.constraints == nil {
            rocket.constraints = [ rocketConstraintToMoon ]
            rocket.physicsBody?.restitution = 0.1
        }
    }
    
    public override func didSimulatePhysics() {
        myCamera.position = rocket.position
    }
    
    // MARK: - Commands
    
    public func buildRocket() {
        rocket.position = CGPoint(x: earth.position.x, y: earth.position.y + earth.size.height / 2 + rocket.size.height / 2)
        addChild(rocket)
    }
    
    public func launchApollo() {
        var rocketToMoon = CGVector.build(from: moon.position - rocket.position)
        
        // Launch the rocket toward the external moon gravity field so that it rotates
        // around the moon before landing
        rocketToMoon.dy = rocketToMoon.dy - moon.gravityRadius * 2
        
        rocket.physicsBody?.applyImpulse(rocketToMoon.normalize() * 10)
    }
    
}

extension ApolloScene: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        switch (bodyA.categoryBitMask, bodyB.categoryBitMask) {
        case (BitmaskCategories.rocket.rawValue, BitmaskCategories.moon.rawValue), (BitmaskCategories.moon.rawValue, BitmaskCategories.rocket.rawValue):
            rocket.physicsBody?.velocity = CGVector.zero
        case (BitmaskCategories.rocket.rawValue, BitmaskCategories.moonAtmosphere.rawValue), (BitmaskCategories.moonAtmosphere.rawValue, BitmaskCategories.rocket.rawValue):
            isRocketInMoonAtmosphere = true
        default:
            debugPrint(bodyA.categoryBitMask)
            debugPrint(bodyB.categoryBitMask)
        }
    }
    
    public func didEnd(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        switch (bodyA.categoryBitMask, bodyB.categoryBitMask) {
        case (BitmaskCategories.rocket.rawValue, BitmaskCategories.moonAtmosphere.rawValue), (BitmaskCategories.moonAtmosphere.rawValue, BitmaskCategories.rocket.rawValue):
            isRocketInMoonAtmosphere = false
        default:
            debugPrint(bodyA.categoryBitMask)
            debugPrint(bodyB.categoryBitMask)
        }
    }
    
}

