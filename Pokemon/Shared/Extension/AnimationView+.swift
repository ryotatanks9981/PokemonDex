import Lottie
import UIKit

extension AnimationView {
    static func createAnimationView(fileName name: String, animateSpeed: CGFloat) -> AnimationView {
        let view = AnimationView(name: name)
        view.animationSpeed = animateSpeed
        view.loopMode = .playOnce
        view.contentMode = .scaleAspectFit
        return view
    }
}
