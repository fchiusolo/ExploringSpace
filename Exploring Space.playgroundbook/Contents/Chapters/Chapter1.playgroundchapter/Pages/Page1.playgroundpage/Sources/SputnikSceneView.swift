import SpriteKit
import PlaygroundSupport

public class SputnikSceneView: SKView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SputnikSceneView: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        guard let scene = scene as? SputnikScene else {
            fatalError("Wrong Scene")
        }
        
        if case let .string(text) = message {
            switch text {
            case Commands.buildSputnik.rawValue:
                scene.buildSputnik()
            case Commands.launchSputnik.rawValue:
                scene.launchSputnik()
            default:
                fatalError("Command \(text) not managed by this scene")
            }
        }
    }
    
}
