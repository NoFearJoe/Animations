//
//  Animations.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import SpriteKit

protocol Animation {
    func action(duration: TimeInterval) -> SKAction
}

extension Array where Element == Animation {
    func action(duration: TimeInterval) -> SKAction {
        return SKAction.sequence(self.map { $0.action(duration: duration) })
    }
}

struct Rotation {
    /// Angle in degrees
    let angle: Int
}

extension Rotation: Animation {
    func action(duration: TimeInterval) -> SKAction {
        return SKAction.rotate(byAngle: angle.asRadians, duration: duration)
    }
}


struct Translation {
    let distance: Size
}

extension Translation: Animation {
    func action(duration: TimeInterval) -> SKAction {
        return SKAction.moveBy(x: distance.width, y: distance.height, duration: duration)
    }
}


struct Scale {
    let scale: Unit
}

extension Scale: Animation {
    func action(duration: TimeInterval) -> SKAction {
        return SKAction.scale(by: scale, duration: duration)
    }
}
