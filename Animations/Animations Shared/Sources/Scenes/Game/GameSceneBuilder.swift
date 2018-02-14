//
//  GameSceneBuilder.swift
//  Animations
//
//  Created by i.kharabet on 14.02.18.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

final class GameSceneBuilder {
    
    static func buildGameScene(with level: Level) -> GameScene {
        let scene = GameScene(level: level)
        return scene
    }
    
}
