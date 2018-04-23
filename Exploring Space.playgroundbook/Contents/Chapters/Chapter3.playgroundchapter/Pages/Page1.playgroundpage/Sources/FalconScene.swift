//
//  FalconScene.swift
//  Test
//
//  Created by Francesco Chiusolo on 23/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import PlaygroundSupport
import SpriteKit

public class FalconScene: SKScene {
    
    enum FalconState {
        case idle, landing, landed
    }
    
    // MARK: - Properties
    
    var falcon = Falcon()
    
    var state = FalconState.landing {
        didSet {
            falcon.physicsBody?.isDynamic = state != .idle
            rotationLabel.isHidden = state != .idle
        }
    }
    
    var landingRotationThreshold = CGFloat(5).toRadians()
    
    var earth = Earth(hasGravityField: true, usSide: true)
    
    var rotationLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo-Regular")
    
    private var userRotation = CGFloat(0)
    
    static let stepFactor = 5
    static let maxRotation = 90
    
    // MARK: - Scene Lifecycle
    
    public override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        earth.position = CGPoint(x: 0, y: 0)
        addChild(earth)
        
        setup()
        
        rotationLabel.fontColor = UIColor.white
        rotationLabel.fontSize = 28
        rotationLabel.position = CGPoint(x: falcon.position.x, y: falcon.position.y - (falcon.size.height / 2) - 48)
        addChild(rotationLabel)
        
        bigbang(count: 23, minX: -500, minY: -500, maxX: 500, maxY: 500)
    }
    
    // MARK: - Commands
    
    public func rotateFalconClockwise() {
        userRotation -= CGFloat(FalconScene.stepFactor).toRadians()
    }
    
    public func rotateFalconCounterlockwise() {
        userRotation += CGFloat(FalconScene.stepFactor).toRadians()
    }
    
    public func land() {
        state = .landing
        falcon.run(SKAction.rotate(byAngle: userRotation, duration: TimeInterval(2)))
    }
    
    // MARK: - Private Functions
    
    func setup() {
        userRotation = CGFloat(0)
        
        // Initialize the falcon above the earth and with a random rotation
        state = .idle
        falcon.position = CGPoint(x: earth.position.x, y: earth.position.y + earth.size.height * 1.5)
        falcon.zRotation = CGFloat(0)
        
        let steps = FalconScene.maxRotation / FalconScene.stepFactor
        
        // Get a random orientation between -maxRotation and +maxmaxRotation that is multiple of stepFactor
        var startRotation = 0
        repeat {
            startRotation = Int.random(min: -steps, max: steps) * FalconScene.stepFactor
        } while startRotation == 0
        
        falcon.zRotation = CGFloat(startRotation).toRadians()
        rotationLabel.text = "Start Rotation: \(startRotation)°"
        
        if falcon.parent == nil {
            addChild(falcon)
        }
    }
    
}

extension FalconScene: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        switch (bodyA.categoryBitMask, bodyB.categoryBitMask) {
        case (BitmaskCategories.falcon.rawValue, BitmaskCategories.earth.rawValue), (BitmaskCategories.earth.rawValue, BitmaskCategories.falcon.rawValue):
            if abs(falcon.zRotation) >= landingRotationThreshold {
                falcon.removeFromParent()
                newExplosion(at: contact.contactPoint)
                Timer.scheduledTimer(withTimeInterval: 1.25, repeats: false, block: { _ in
                    self.setup()
                })
            } else {
                falcon.zRotation = 0.0
                state = .landed
                falcon.removeSpark()
                finalFireworks()
            }
        default:
            debugPrint(bodyA.categoryBitMask)
            debugPrint(bodyB.categoryBitMask)
        }
    }
    
}
