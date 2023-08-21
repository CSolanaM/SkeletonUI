import SwiftUI
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let shape: ShapeType
    let animation: AnimationType
    let appearance: AppearanceType
    @State var animate: Bool = false

    public func body(content: Content) -> some View {
        content
            .modifier(SkeletonAnimatableModifier(CGFloat(integerLiteral: Int(truncating: animate as NSNumber)), appearance))
            .clipShape(SkeletonShape(shape))
            .animation(animation.type)
            .onAppear { animate.toggle() }
    }
}
