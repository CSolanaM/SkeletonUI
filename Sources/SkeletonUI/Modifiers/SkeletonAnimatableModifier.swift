import SwiftUI

struct SkeletonAnimatableModifier: AnimatableModifier {
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
    }
}
