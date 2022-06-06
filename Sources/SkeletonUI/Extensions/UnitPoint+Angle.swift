#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension UnitPoint {
    static func point(with position: CGFloat, _ radius: CGFloat, _ angle: CGFloat) -> UnitPoint {
        let radians = angle * .pi / 180.0
        return UnitPoint(x: (position + radius) * cos(radians), y: (position + radius) * sin(radians))
    }
}

#endif
