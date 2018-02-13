//
//  GameScene.swift
//  Animations Shared
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var heroNode: SKShapeNode!
    
    let level = Level.init(size: Size(width: 500, height: 500),
                           initialPosition: Point(x: 100, y: 250),
                           targetPosition: Point(x: 400, y: 250),
                           enemies: [])
    
    lazy var path = Path(startPosition: level.initialPosition, endPosition: level.targetPosition, duration: 3)
    
    class func newGameScene() -> GameScene {
        let scene = GameScene(size: Size(width: 500, height: 500).cgSize)
        scene.scaleMode = .aspectFill
        return scene
    }
    
    func setUpScene() {
        heroNode = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        addChild(heroNode)
        
        heroNode.position = path.startPosition.cgPoint
    }
    
    #if os(watchOS)
    override func sceneDidLoad() {
        self.setUpScene()
    }
    #else
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    #endif
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

#if os(iOS) || os(tvOS)
// Touch-based event handling
extension GameScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heroNode.run(SKAction.repeatForever(path.action))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
   
}
#endif

#if os(OSX)
// Mouse-based event handling
extension GameScene {

    override func mouseDown(with event: NSEvent) {

    }
    
    override func mouseDragged(with event: NSEvent) {

    }
    
    override func mouseUp(with event: NSEvent) {

    }

}
#endif

