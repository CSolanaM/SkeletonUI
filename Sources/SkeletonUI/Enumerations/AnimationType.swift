import SwiftUI

public enum AnimationType: Equatable {
    case none
    case pulse(duration: Double = 2, delay: Double = 1, speed: Double = 2, autoreverses: Bool = true)
    case linear(duration: Double = 4, delay: Double = 1, speed: Double = 4, autoreverses: Bool = false)
    
    var type: Animation? {
        switch self {
        case .none:
            return .none
        case let .pulse(duration, delay, speed, autoreverses):
            return Animation.easeIn(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
        case let .linear(duration, delay, speed, autoreverses):
            return Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
        }
    }
}
