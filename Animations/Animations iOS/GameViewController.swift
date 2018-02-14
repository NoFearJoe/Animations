//
//  GameViewController.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geometry = Level.Geometry(size: Size(width: 500, height: 500))
        
        let hero = Level.Hero(initialPosition: Point(x: 100, y: 250),
                              targetPosition: Point(x: 400, y: 250),
                              size: Size(width: 50, height: 50),
                              speed: 3)
        
        let level = Level(geometry: geometry,
                          hero: hero,
                          enemies: [])
        
        let scene = GameSceneBuilder.buildGameScene(with: level)

        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
