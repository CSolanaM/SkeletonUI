import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func skeleton(with loading: Bool? = .none,
                  size: CGSize? = .none,
                  transition: (type: AnyTransition, animation: Animation?) = (.opacity, .default),
                  animation: AnimationType = .linear(),
                  appearance: AppearanceType = .gradient(),
                  shape: ShapeType = .capsule,
                  lines: Int = 1,
                  scales: [Int: CGFloat]? = .none,
                  spacing: CGFloat? = .none) -> some View {
        SkeletonView(content: self,
                     loading: loading,
                     size: size,
                     transition: transition,
                     animation: animation,
                     appearance: appearance,
                     shape: shape,
                     lines: lines,
                     scales: scales,
                     spacing: spacing)
    }
  
  func skeletonActive(_ loading: Bool) -> some View {
      environment(\.skeletonActive, loading)
  }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private struct SkeletonActiveKey: EnvironmentKey {
    static let defaultValue = false
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private extension EnvironmentValues {
    var skeletonActive: Bool {
        get { self[SkeletonActiveKey.self] }
        set { self[SkeletonActiveKey.self] = newValue }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private struct SkeletonView<Content: View>: View {
    @Environment(\.skeletonActive) private var skeletonActive

    let content: Content
    let loading: Bool?
    let size: CGSize?
    let transition: (type: AnyTransition, animation: Animation?)
    let animation: AnimationType
    let appearance: AppearanceType
    let shape: ShapeType
    let lines: Int
    let scales: [Int: CGFloat]?
    let spacing: CGFloat?

    var body: some View {
        let isLoading = loading ?? skeletonActive

        ZStack {
            if isLoading {
                VStack(spacing: spacing) {
                    ForEach(.zero ..< lines, id: \.self) { line in
                        GeometryReader { geometry in
                            content
                                .modifier(SkeletonModifier(shape: shape, animation: animation, appearance: appearance))
                                .frame(width: (scales?[line] ?? 1) * geometry.size.width, height: geometry.size.height)
                        }
                    }
                }
                .frame(width: size?.width, height: size?.height)
                .transition(transition.type)
            } else {
                content
                    .transition(transition.type)
            }
        }
        .animation(transition.animation, value: isLoading)
    }
}
