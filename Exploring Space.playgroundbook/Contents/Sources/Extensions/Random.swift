//
//  Int.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import Foundation
import CoreGraphics

extension Int {
    
    public static func random(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}

extension CGFloat {
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return min + (CGFloat(arc4random()) / CGFloat(UINT32_MAX)) * (max - min)
    }
    
}
