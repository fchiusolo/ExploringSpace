import SpriteKit
import PlaygroundSupport

public class ApolloSceneView: SKView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ApolloSceneView: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        guard let scene = scene as? ApolloScene else {
            fatalError("Wrong Scene")
        }
        
        if case let .string(text) = message {
            switch text {
            case Commands.buildRocket.rawValue:
                scene.buildRocket()
            case Commands.launchApollo.rawValue:
                scene.launchApollo()
            default:
                fatalError("Command \(text) not managed by this scene")
            }
        }
    }
    
}
