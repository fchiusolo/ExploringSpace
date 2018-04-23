import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
let sceneView = ApolloSceneView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
guard let scene = ApolloScene(fileNamed: "GameScene") else {
    fatalError("Scene not found")
}

// Set the scale mode to scale to fit the window
scene.scaleMode = .aspectFill

// Present the scene
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
