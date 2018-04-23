//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

var hasBuiltSputnik = false

func buildSputnik() {
    let message: PlaygroundValue = .string(Commands.buildSputnik.rawValue)
    proxy?.send(message)
    hasBuiltSputnik = true
}

func launchSputnik() {
    if hasBuiltSputnik {
        let message: PlaygroundValue = .string(Commands.launchSputnik.rawValue)
        proxy?.send(message)
        page.assessmentStatus = .pass(message: "You did it, go to the [Next Page](@next)")
    } else {
        page.assessmentStatus = .fail(hints: ["You need to build the sputnik before launching it."], solution: "Call the function `buildSputnik()` and then `launchSputnik()`")
    }
}
//#-end-hidden-code
/*:
 # Exploring Space
 Welcome to "Exploring Space", here we are going to learn some of the key events in the history of the space exploration while practicing our coding skills.
 */

/*:
 ## Sputnik 1 🛰
 After the WWII the United States and the Soviet Union were competing in the so called "Space Race"; one of the key events of this period was the launch of the first satellite in orbit called "Sputnik 1" on October 4, 1957.
 * Callout(Goal): Build and launch the sputnik using functions.
 Every function represents a reusable block of code, doesn't matter how it is implemented you can execute complex tasks, so in order to build a satellite like the Sputnik 1 you don't need to be a rocket scientist 😎.
 */
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, buildSputnik(), launchSputnik())
//#-editable-code Build the Sputnik I and launch it in orbit
//#-end-editable-code

/*:
 * Callout(Bonus): 🐶
 Do you know what was the first linving being sent to the space?
 It was a dog and her name was Laika.
 */
