//
//  Constants.swift
//  Test
//
//  Created by Francesco Chiusolo on 22/03/2018.
//  Copyright © 2018 Francesco Chiusolo. All rights reserved.
//

import Foundation
import CoreGraphics

public enum BitmaskCategories: UInt32 {
    case rocket = 1
    case moon = 2
    case moonAtmosphere = 4
    case earth = 8
    case falcon = 16
}

public enum ZPosition: CGFloat {
    case background = -1
    case foreground = 1
    case mainActor = 2
    case fireworks = 3
}
