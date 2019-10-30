import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func skeleton(with loading: Bool) -> ModifiedContent<Self, SkeletonModifier> {
        modifier(SkeletonModifier(skeleton: SkeletonInteractor(loading)))
    }
}
