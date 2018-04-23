//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
page.needsIndefiniteExecution = true
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

//page.assessmentStatus = .fail(hints: [
//    "The number of times the loop iterate is defined by the range after the `in` keywork",
//    "Iterate as many times as needed by the Falcon in order to have a 0° rotation, that is the initial rotation value divided by the rotation amount applied at each step (5°).",
//    "The rotation to apply at each step, clockwise or counterclockwise, depends on the sign of the initial rotation."
//    ], solution: nil)

func rotateClockwise() {
    let message: PlaygroundValue = .string(Commands.rotateFalconClockwise.rawValue)
    proxy?.send(message)
}

func rotateCounterclockwise() {
    let message: PlaygroundValue = .string(Commands.rotateFalconCounterclockwise.rawValue)
    proxy?.send(message)
}

func land() {
    let message: PlaygroundValue = .string(Commands.landFalcon.rawValue)
    proxy?.send(message)
}
//#-end-hidden-code
/*:
 # SpaceX
 One of the most important modern achievement is the development of a rocket that can land and be reused for multiple missions so that the space missions become more affordable. This goal was reached by the company SpaceX with the rocket Falcon 9 that made a successful landing for the first time on December 21, 2015.
 * Callout(Goal):
 Alright, you are in the mission control center and your job is to make the Falcon land successfully. It starts is descent on earth with an initial rotation. You have a "for loop" in your toolbox and functions to make it rotate clockwise or counterclockwise by 5°.
 */

//#-code-completion(everything, hide)
for _ in 0 ..< /*#-editable-code*/<#T##steps##Int#>/*#-end-editable-code*/ {
    //#-code-completion(identifier, show, rotateClockwise(), rotateCounterclockwise())
    //#-editable-code Make it rotate clockwise or counterclockwise
    //#-end-editable-code
}

/*:
 Let's write the history and start the landing phase.
 */
//#-code-completion(identifier, hide, rotateClockwise(), rotateCounterclockwise())
//#-code-completion(identifier, show, land())
//#-editable-code Start landing
//#-end-editable-code
