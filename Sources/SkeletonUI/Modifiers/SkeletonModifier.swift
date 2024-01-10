import SwiftUI
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    let shape: ShapeType
    let animation: AnimationType
    let appearance: AppearanceType
    @State var animate: Bool = false

    public func body(content: Content) -> some View {
        content
            .modifier(SkeletonAnimatableModifier(phase, appearance))
            .clipShape(SkeletonShape(shape))
            .animation(animation.type, value: phase)
            .onAppear {
                phase = 1
            }
    }
}
