import SwiftUI

public enum AnimationType: Equatable {
    case none
    case pulse(duration: Double = 1.5, delay: Double = .zero, speed: Double = 1, autoreverses: Bool = true)
    case linear(duration: Double = 1.5, delay: Double = .zero, speed: Double = 1, autoreverses: Bool = false)
    
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
