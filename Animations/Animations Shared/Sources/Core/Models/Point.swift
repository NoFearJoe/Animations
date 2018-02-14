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

extension Point: Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

infix operator ~=

extension Point {
    static func ~= (lhs: Point, rhs: Point) -> Bool {
        return Int(lhs.x) == Int(rhs.x) && Int(lhs.y) == Int(rhs.y)
    }
}
