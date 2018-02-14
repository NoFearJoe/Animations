//
//  Path.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import SpriteKit
import struct Foundation.TimeInterval

class Path {
    
    class KeyFrame {
        var position: Point
        
        var animations: [Animation] = []
        
        init(position: Point) {
            self.position = position
        }
    }
    
    let duration: TimeInterval
    
    let startPosition: Point
    let endPosition: Point
    
    private(set) var keyFrames: [KeyFrame]
    
    init(startPosition: Point, endPosition: Point, duration: TimeInterval) {
        self.startPosition = startPosition
        self.endPosition = endPosition
        self.duration = duration
        self.keyFrames = []
    }
    
}

extension Path {
    
    func addPoint(_ point: Point) {
        keyFrames.append(Path.KeyFrame(position: point))
    }
    
    func removePoint(_ point: Point) {
        
    }
    
    func movePoint(_ point: Point, to targetPoint: Point) {
        
    }
    
}

extension Path {
    var bezierPath: UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: startPosition.cgPoint)
        
        keyFrames.forEach { keyFrame in
            path.addLine(to: keyFrame.position.cgPoint)
        }
        
        path.addLine(to: endPosition.cgPoint)
        
        return path
    }
    
    var cgPath: CGPath {
        return bezierPath.cgPath
    }
}

extension Path {
    var action: SKAction {
        let keyFrameActions = keyFrames.map { keyFrame -> SKAction in
            let actions = keyFrame.animations.map { $0.action(duration: 3) }
            if actions.isEmpty {
                return SKAction.rotate(byAngle: 0, duration: 3)
            }
            return SKAction.group(actions)
        }
        
        let keyFrameActionsSequence: SKAction
        if keyFrameActions.count == 1 {
            keyFrameActionsSequence = keyFrameActions.first!
        } else {
            keyFrameActionsSequence = SKAction.sequence(keyFrameActions)
        }
        
        let followPathAction = SKAction.follow(cgPath,
                                               asOffset: false,
                                               orientToPath: false,
                                               duration: duration)
        
        return SKAction.group([followPathAction, keyFrameActionsSequence])
    }
}
