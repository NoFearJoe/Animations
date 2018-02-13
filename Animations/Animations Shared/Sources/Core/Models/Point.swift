//
//  Point.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import struct CoreGraphics.CGPoint

struct Point {
    let x: Unit
    let y: Unit
}

extension Point {
    var cgPoint: CGPoint {
        return CGPoint(x: x, y: y)
    }
}
