//
//  Enemy.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

class Enemy {
    
    let initialPosition: Point
    
    let animations: [Animation]
    
    init(initialPosition: Point, animations: [Animation]) {
        self.initialPosition = initialPosition
        self.animations = animations
    }
    
}
