//
//  Path.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import SpriteKit
import struct Foundation.TimeInterval

struct Path {
    
    struct Segment {
        var startPosition: Point
        var endPosition: Point
        
        var animations: [Animation]
    }
    
    let duration: TimeInterval
    
    let startPosition: Point
    let endPosition: Point
    
    private(set) var segments: [Segment]
    
}

extension Path {
    
    func addPoint(_ point: Point) {
        
    }
    
    func removePoint(_ point: Point) {
        
    }
    
    func movePoint(_ point: Point, to targetPoint: Point) {
        
    }
    
}

extension Path {
    init(startPosition: Point, endPosition: Point, duration: TimeInterval) {
        let initialSegment = Segment(startPosition: startPosition, endPosition: endPosition)
        self.init(duration: duration,
                  startPosition: startPosition,
                  endPosition: endPosition,
                  segments: [initialSegment])
    }
}

extension Path {
    var bezierPath: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPosition.cgPoint)
        
        segments.forEach { segment in
            path.addLine(to: segment.endPosition.cgPoint)
        }
        
        return path
    }
    
    var cgPath: CGPath {
        return bezierPath.cgPath
    }
}

extension Path {
    var action: SKAction {
        return SKAction.follow(cgPath,
                               asOffset: false,
                               orientToPath: false,
                               duration: duration)
    }
}

extension Path.Segment {
    init(startPosition: Point, endPosition: Point) {
        self.init(startPosition: startPosition,
                  endPosition: endPosition,
                  animations: [])
    }
}
