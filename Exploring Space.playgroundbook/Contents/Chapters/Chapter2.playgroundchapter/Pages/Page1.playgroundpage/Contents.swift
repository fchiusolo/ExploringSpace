//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

enum State {
    case none, caughtScientist, builtRocket
}
var state = State.none

class VonBraun {
    
    init() {}
    
    func buildRocket() {
        let message: PlaygroundValue = .string(Commands.buildRocket.rawValue)
        proxy?.send(message)
        state = .builtRocket
    }
    
}

func catchVonBraun() -> VonBraun {
    state = .caughtScientist
    return VonBraun()
}

func launchApollo() {
    switch state {
    case .none:
        page.assessmentStatus = .fail(hints: ["At first you need to create the object representing the Scientist von Braun."], solution: "Call the function `catchVonBraun()`")
    case .caughtScientist:
        page.assessmentStatus = .fail(hints: [
            "You have to make von Braun build the rocket otherwise the mission Apollo can't start.",
            "The syntax for calling functions associated to an object is `object.functionName()`"
            ], solution: "`vonBraun.buildRocket()`")
    case .builtRocket:
        let message: PlaygroundValue = .string(Commands.launchApollo.rawValue)
        proxy?.send(message)
        page.assessmentStatus = .pass(message: "The Apollo spacecraft will reach soon the Moon...when you are ready go to the [Next Page](@next)")
    }
}
//#-end-hidden-code
/*:
 _"One small step for man, one giant leap for mankind."_
 */

/*:
 ## Wernher von Braun 🚀
 Wernher Magnus Maximilian von Braun was a german scientist who worked on the development of rocket technology in the Nazi Germany. After the WWII he was secretly moved to the US were he built the rocket that propelled the Apollo spacecraft.
 * Callout(Goal): Let's practice with Objects.
 An Object models a real world entity by defining its properties with data structures and its behaviour with functions. For example we can represent the scientist von Braun with an object that has a function to build a rocket associated to it.
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, catchVonBraun())
let vonBraun = /*#-editable-code*/<#T##Let's catch von Braun##vonBraun#>/*#-end-editable-code*/
//#-code-completion(identifier, hide, catchVonBraun())
//#-code-completion(identifier, show, vonBraun, ., buildRocket())
//#-editable-code Let's make von Braun build the rocket
//#-end-editable-code
/*:
 ## Apollo 11 🌝
 The first two humans that landed on the Moon were Neil Armstrong and Buzz Aldrin on July 20, 1969 leading the mission Apollo.
 */
//#-code-completion(identifier, hide, vonBraun, ., buildRocket())
//#-code-completion(identifier, show, launchApollo())
//#-editable-code Launch to the moon
//#-end-editable-code
