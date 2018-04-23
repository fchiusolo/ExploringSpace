//
//  CGVector.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import CoreGraphics

extension CGVector {
    
    public static func build(from point: CGPoint) -> CGVector {
        return CGVector(dx: point.x, dy: point.y)
    }
    
    public func module() -> CGFloat {
        return CGFloat(sqrtf(Float(dx * dx + dy * dy)))
    }
    
    public func normalize() -> CGVector {
        let module = self.module()
        return CGVector(dx: self.dx / module, dy: self.dy / module)
    }
    
    public static func *(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
}
