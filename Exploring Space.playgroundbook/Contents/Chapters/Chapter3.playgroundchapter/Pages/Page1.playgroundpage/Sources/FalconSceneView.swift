import SpriteKit
import PlaygroundSupport

public class FalconSceneView: SKView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FalconSceneView: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        guard let scene = scene as? FalconScene else {
            fatalError("Wrong Scene")
        }
        
        if case let .string(text) = message {
            switch text {
            case Commands.rotateFalconClockwise.rawValue:
                scene.rotateFalconClockwise()
            case Commands.rotateFalconCounterclockwise.rawValue:
                scene.rotateFalconCounterlockwise()
            case Commands.landFalcon.rawValue:
                scene.land()
            default:
                fatalError("Command \(text) not managed by this scene")
            }
        }
    }
    
}

