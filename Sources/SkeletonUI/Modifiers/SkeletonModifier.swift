import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let skeleton: SkeletonInteractable

    public func body(content: Content) -> some View {
        ZStack {
            if skeleton.presenter.loading {
                VStack(spacing: skeleton.multiline.presenter.spacing) {
                    ForEach(0 ..< skeleton.multiline.presenter.lines) { line in
                        SkeletonView(skeleton: self.skeleton(line))
                    }
                }.transition(skeleton.presenter.transition)
            } else {
                content.transition(skeleton.presenter.transition)
            }
        }
        .animation(skeleton.presenter.animated, value: skeleton.presenter.loading)
    }

    private func skeleton(_ line: Int) -> SkeletonInteractable {
        skeleton.multiline.line.send(line)
        return skeleton
    }
}
