import SwiftUI

struct SkeletonShape: Shape {
    @ObservedObject private var angle: AnglePresenter
    @ObservedObject private var shape: ShapePresenter
    @ObservedObject private var radius: RadiusPresenter
    @ObservedObject private var opacity: OpacityPresenter
    @ObservedObject private var position: PositionPresenter
    @ObservedObject private var appearance: AppearancePresenter

    init(angle: AnglePresenter, shape: ShapePresenter, radius: RadiusPresenter, opacity: OpacityPresenter, position: PositionPresenter, appearance: AppearancePresenter) {
        self.angle = angle
        self.shape = shape
        self.radius = radius
        self.opacity = opacity
        self.position = position
        self.appearance = appearance
    }

    func path(in rect: CGRect) -> Path {
        switch shape.type {
        case let .rounded(.radius(radius, style)):
            return RoundedRectangle(cornerRadius: radius, style: style).path(in: rect)
        case let .rounded(.size(size, style)):
            return RoundedRectangle(cornerSize: size, style: style).path(in: rect)
        case .rectangle:
            return Rectangle().path(in: rect)
        case .circle:
            return Circle().path(in: rect)
        case .ellipse:
            return Ellipse().path(in: rect)
        case .capsule:
            return Capsule().path(in: rect)
        }
    }

    var body: some View {
        switch appearance.type {
        case let .solid(color, background):
            return AnyView(ZStack {
                self.fill(background)
                self.fill(color)
                    .opacity(opacity.value)
            })
        case let .gradient(.linear, color, background, radius, angle):
            return AnyView(ZStack {
                self.fill(background)
                self.fill(LinearGradient(gradient: Gradient(colors: [background, color, background]), startPoint: .point(with: position.value, -radius, angle), endPoint: .point(with: position.value, radius, angle))).opacity(opacity.value)
            })
        case let .gradient(.radial, color, background, _, _):
            return AnyView(ZStack {
                self.fill(background)
                self.fill(RadialGradient(gradient: Gradient(colors: [color, background]), center: .center, startRadius: .zero, endRadius: radius.value))
                    .opacity(opacity.value)
            })
        case let .gradient(.angular, color, background, _, _):
            return AnyView(ZStack {
                self.fill(background)
                self.fill(AngularGradient(gradient: Gradient(colors: [background, color, background]), center: .center, startAngle: .zero, endAngle: .degrees(angle.value)))
                    .opacity(opacity.value)
            })
        }
    }
}
