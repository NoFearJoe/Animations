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
    private var pathNode: SKShapeNode!
    
    private var anchorNodes: [SKShapeNode] = []
    private var keyNodes: [SKShapeNode] = []
    
    private let level: Level
    private let path: Path
    
    init(level: Level) {
        self.level = level
        self.path = Path(startPosition: level.hero.initialPosition,
                         endPosition: level.hero.targetPosition,
                         duration: TimeInterval(level.hero.speed))
        
        super.init(size: level.geometry.size.cgSize)
        
        scaleMode = .aspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpScene() {
        addPathNode()
        addHeroNode()
        addAnchorNodes()
        addKeyNodes()
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
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let point = Point(x: location.x, y: location.y)
        path.addPoint(point)
        
        addPathNode()
        addKeyNodes()
        
        heroNode.removeAllActions()
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

private extension GameScene {
    
    func addPathNode() {
        pathNode?.removeFromParent()
        
        pathNode = SKShapeNode(path: path.cgPath)
        pathNode.zPosition = 10
        pathNode.strokeColor = .green
        addChild(pathNode)
    }
    
    func addHeroNode() {
        heroNode?.removeFromParent()
        
        heroNode = SKShapeNode(rectOf: level.hero.size.cgSize)
        heroNode.position = path.startPosition.cgPoint
        heroNode.zPosition = 20
        addChild(heroNode)
    }
    
    func addAnchorNodes() {
        removeChildren(in: anchorNodes)
        anchorNodes.removeAll()
        
        anchorNodes.append(makeAnchorNode(position: path.startPosition))
        anchorNodes.append(makeAnchorNode(position: path.endPosition))
        
        anchorNodes.forEach { node in
            addChild(node)
        }
    }
    
    func addKeyNodes() {
        removeChildren(in: keyNodes)
        keyNodes.removeAll()
        
        path.keyFrames.forEach { keyFrame in
            keyNodes.append(makeKeyNode(position: keyFrame.position))
        }
        
        keyNodes.forEach { node in
            addChild(node)
        }
    }
    
    func makeAnchorNode(position: Point) -> SKShapeNode {
        let node = SKShapeNode(circleOfRadius: 5)
        node.position = position.cgPoint
        node.zPosition = 15
        node.fillColor = .blue
        node.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        node.physicsBody?.collisionBitMask = 8
        node.physicsBody?.isDynamic = false
        return node
    }
    
    func makeKeyNode(position: Point) -> SKShapeNode {
        let node = SKShapeNode(circleOfRadius: 4)
        node.position = position.cgPoint
        node.zPosition = 15
        node.fillColor = .yellow
        node.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        node.physicsBody?.collisionBitMask = 8
        node.physicsBody?.isDynamic = false
        return node
    }
    
}

