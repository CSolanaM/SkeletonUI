import SwiftUI

struct SkeletonView: View {
    private var shape: ShapePresenter
    private var angle: AnglePresenter
    private var radius: RadiusPresenter
    private var opacity: OpacityPresenter
    private var position: PositionPresenter
    private var appearance: AppearancePresenter

    init(skeleton: SkeletonInteractable, line: Int) {
        shape = skeleton.shape.presenter
        angle = skeleton.animation.angle.presenter
        radius = skeleton.animation.radius.presenter
        opacity = skeleton.animation.opacity.presenter
        position = skeleton.animation.position.presenter
        appearance = skeleton.appearance.presenter

        skeleton.multiline.line.send(line)
    }

    var body: some View {
        SkeletonShape(angle: angle, shape: shape, radius: radius, opacity: opacity, position: position, appearance: appearance)
    }
}
