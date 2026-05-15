import SwiftUI

public enum RoundedType: Equatable {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
    case corners(topLeadingRadius: CGFloat,
                 bottomLeadingRadius: CGFloat,
                 bottomTrailingRadius: CGFloat,
                 topTrailingRadius: CGFloat)
}

public enum ShapeType: Equatable {
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
        case let .rounded(.corners(topLeadingRadius, bottomLeadingRadius, bottomTrailingRadius, topTrailingRadius)):
            if #available(iOS 16.0, *) {
                return .rect(topLeadingRadius: topLeadingRadius,
                             bottomLeadingRadius: bottomLeadingRadius,
                             bottomTrailingRadius: bottomTrailingRadius,
                             topTrailingRadius: topTrailingRadius)
            } else {
                return RoundedCorners(topLeadingRadius: topLeadingRadius,
                                      topTrailingRadius: topTrailingRadius,
                                      bottomLeadingRadius: bottomLeadingRadius,
                                      bottomTrailingRadius: bottomTrailingRadius)
            }
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
