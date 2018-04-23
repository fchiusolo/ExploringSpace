//
//  SputnikScene.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import SpriteKit

public class SputnikScene: SKScene {
    
    enum SputnikState {
        case notReady, built, launching, orbiting
    }
    
    // MARK: - Properties
    
    var state = SputnikState.notReady
    
    var earth = Earth(hasGravityField: true, usSide: false)
    
    var sputnik = Sputnik()
    
    // MARK: - Scene Lifecycle
    
    public override func didMove(to view: SKView) {
        
        earth.position = CGPoint(x: 0, y: 0)
        addChild(earth)
        
        bigbang(count: 23, minX: -500, minY: -500, maxX: 500, maxY: 500)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if state == .launching, let vy = sputnik.physicsBody?.velocity.dy {
            // After launch, bind the sputnik at the distance in which it has almost stopped.
            if abs(vy) < CGFloat(5) {
                let sputnikToEarth = CGVector.build(from: earth.position - sputnik.position)
                sputnik.constraints = [
                    SKConstraint.distance(SKRange(constantValue: sputnikToEarth.module()), to: earth)
                ]
                state = .orbiting
            }
        } else if state == .orbiting, let vx = sputnik.physicsBody?.velocity.dx {
            // When the sputnik is in the orbit, apply forces to let it orbiting around earth.
            if abs(vx) < CGFloat(40) {
                if sputnik.position.y > earth.position.y {
                    sputnik.physicsBody?.applyForce(CGVector(dx: CGFloat(-2.5), dy: 0))
                } else {
                    sputnik.physicsBody?.applyForce(CGVector(dx: CGFloat(2.5), dy: 0))
                }
            }
        }
    }
    
    // MARK: - Commands
    
    public func buildSputnik() {
        if state == .notReady, sputnik.parent == nil {
            sputnik.position = CGPoint(x: earth.position.x, y: earth.position.y + earth.size.height * 0.5)
            addChild(sputnik)
            state = .built
        }
    }
    
    public func launchSputnik() {
        if state == .built {
            sputnik.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 5))
            state = .launching
        }
    }
    
}
