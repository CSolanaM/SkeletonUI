import SwiftUI

public enum RoundedType: Equatable, Sendable {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
}

public enum ShapeType: Equatable, Sendable {
    case rounded(RoundedType)
    case rectangle
    case circle
    case ellipse
    case capsule
    
    var type: any Shape {
        switch self {
        case let .rounded(.radius(radius, style)):
            return RoundedRectangle(cornerRadius: radius, style: style)
        case let .rounded(.size(size, style)):
            return RoundedRectangle(cornerSize: size, style: style)
        case .rectangle:
            return Rectangle()
        case .circle:
            return Circle()
        case .ellipse:
            return Ellipse()
        case .capsule:
            return Capsule()
        }
    }
}
