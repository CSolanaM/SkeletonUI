import SwiftUI

struct SkeletonView: View {
    private var shape: ShapePresenter
    private var angle: AngleInteractable
    private var radius: RadiusInteractable
    private var opacity: OpacityInteractable
    private var multiline: MultilinePresenter
    private var position: PositionInteractable
    private var appearance: AppearancePresenter

    init(skeleton: SkeletonInteractable) {
        shape = skeleton.shape.presenter
        angle = skeleton.animation.angle
        radius = skeleton.animation.radius
        opacity = skeleton.animation.opacity
        position = skeleton.animation.position
        multiline = skeleton.multiline.presenter
        appearance = skeleton.appearance.presenter
    }

    var body: some View {
        GeometryReader { geometry in
            SkeletonShape(angle: self.angle.presenter, shape: self.shape, radius: self.radius.presenter, opacity: self.opacity.presenter, position: self.position.presenter, appearance: self.appearance)
                .frame(width: self.multiline.scale * geometry.size.width, height: geometry.size.height)
                .onAppear {
                    withAnimation(self.position.presenter.animation) {
                        self.position.value.send(self.position.presenter.range.upperBound)
                    }
                    withAnimation(self.opacity.presenter.animation) {
                        self.opacity.value.send(self.opacity.presenter.range.upperBound)
                    }
                    withAnimation(self.radius.presenter.animation) {
                        self.radius.value.send(self.radius.presenter.range.upperBound)
                    }
                    withAnimation(self.angle.presenter.animation) {
                        self.angle.value.send(self.angle.presenter.range.upperBound)
                    }
                }
        }
    }
}
