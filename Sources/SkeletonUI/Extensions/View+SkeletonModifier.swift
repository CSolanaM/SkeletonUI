import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func skeleton(with loading: Bool,
                  size: CGSize? = .none,
                  transition: (type: AnyTransition, animation: Animation?) = (.opacity, .default),
                  animation: AnimationType = .linear(),
                  appearance: AppearanceType = .gradient(),
                  shape: ShapeType = .capsule,
                  lines: Int = 1,
                  scales: [Int: CGFloat]? = .none,
                  spacing: CGFloat? = .none) -> some View {
        ZStack {
            if loading {
                VStack(spacing: spacing) {
                    ForEach(.zero ..< lines, id: \.self) { line in
                        GeometryReader { geometry in
                            modifier(SkeletonModifier(shape: shape, animation: animation, appearance: appearance))
                                .frame(width: (scales?[line] ?? 1) * geometry.size.width, height: geometry.size.height)
                        }
                    }
                }
                .frame(width: size?.width, height: size?.height)
                .transition(transition.type)
            } else {
                self
                    .transition(transition.type)
            }
        }
        .animation(transition.animation, value: loading)
    }
}
