import SwiftUI
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let shape: ShapeType
    let animation: AnimationType
    let appearance: AppearanceType
    @State var phase: Bool = false

    public func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(CGFloat(integerLiteral: Int(truncating: phase as NSNumber)), appearance))
            .clipShape(SkeletonShape(shape))
            .animation(animation.type)
            .onAppear { phase.toggle() }
    }
}

struct SkeletonShape: Shape {
    let shape: ShapeType

    init(_ shape: ShapeType) {
        self.shape = shape
    }

    func path(in rect: CGRect) -> Path {
        shape.type.path(in: rect)
    }
}

struct AnimatedMask: AnimatableModifier {
    var phase: CGFloat
    let appearance: AppearanceType

    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    init(_ phase: CGFloat, _ appearance: AppearanceType) {
        self.phase = phase
        self.appearance = appearance
    }
    
    func body(content: Content) -> some View {
        appearance.type(phase)
            .opacity(1)
    }
}
