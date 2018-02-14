//
//  Level.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

struct Level {
    
    struct Geometry {
        let size: Size
    }
    
    struct Hero {
        let initialPosition: Point
        let targetPosition: Point
        
        let size: Size
        
        /// Defines how many seconds is needed to go from initial to target position
        let speed: Unit
    }
    
    let geometry: Geometry
    
    let hero: Hero
    
    let enemies: [Enemy]
    
}
