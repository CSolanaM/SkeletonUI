import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let skeleton: SkeletonInteractable
    @State var animation: Bool = false

    public func body(content: Content) -> some View {
        ZStack {
            if skeleton.presenter.loading {
                VStack(spacing: skeleton.multiline.presenter.spacing) {
                    ForEach(0 ..< skeleton.multiline.presenter.lines, id: \.self) { line in
                        GeometryReader { geometry in
                            SkeletonView(skeleton: skeleton, line: line)
                                .frame(width: skeleton.multiline.presenter.scale * geometry.size.width, height: geometry.size.height)
                                .onReceive([animation].publisher.filter { $0 }.removeDuplicates().first()) { _ in
                                    withAnimation(skeleton.animation.position.presenter.animation) {
                                        skeleton.animation.position.value.send(skeleton.animation.position.presenter.range.upperBound)
                                    }
                                    withAnimation(skeleton.animation.opacity.presenter.animation) {
                                        skeleton.animation.opacity.value.send(skeleton.animation.opacity.presenter.range.upperBound)
                                    }
                                    withAnimation(skeleton.animation.radius.presenter.animation) {
                                        skeleton.animation.radius.value.send(skeleton.animation.radius.presenter.range.upperBound)
                                    }
                                    withAnimation(skeleton.animation.angle.presenter.animation) {
                                        skeleton.animation.angle.value.send(skeleton.animation.angle.presenter.range.upperBound)
                                    }
                                }
                                .onAppear {
                                    DispatchQueue.main.async {
                                        animation = true
                                    }
                                }
                                .onDisappear {
                                    DispatchQueue.main.async {
                                        animation = false
                                    }
                                }
                        }
                    }
                }
                .frame(width: skeleton.presenter.size?.width, height: skeleton.presenter.size?.height)
                .transition(skeleton.presenter.transition)
            } else {
                content
                    .transition(skeleton.presenter.transition)
            }
        }
        .animation(skeleton.presenter.animated, value: skeleton.presenter.loading)
    }
}
