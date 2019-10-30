import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let skeleton: SkeletonInteractable

    public func body(content: Content) -> some View {
        if skeleton.loading.value {
            return AnyView(VStack(spacing: skeleton.multiline.presenter.spacing) {
                ForEach(0 ..< skeleton.multiline.presenter.lines) { line in
                    SkeletonView(skeleton: self.skeleton(line))
                }
            })
        } else {
            return AnyView(content)
        }
    }

    private func skeleton(_ line: Int) -> SkeletonInteractable {
        skeleton.multiline.line.send(line)
        return skeleton
    }
}
