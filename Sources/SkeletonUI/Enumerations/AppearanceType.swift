import SwiftUI

public enum GradientType: Equatable {
    case linear
    case angular
    case radial
}

public struct SkeletonColor {
    public static var primary: Color {
        #if os(iOS) || os(visionOS)
            return Color(.systemGray4)
        #elseif os(tvOS)
            return Color(.tertiaryLabel)
        #elseif os(watchOS)
            return Color.secondary
        #elseif os(macOS)
            return Color(.alternateSelectedControlColor)
        #endif
    }

    public static var background: Color {
        #if os(iOS) || os(visionOS)
            return Color(.systemGray6)
        #elseif os(tvOS)
            return Color(.secondaryLabel)
        #elseif os(watchOS)
            return Color.primary
        #elseif os(macOS)
            return Color(.unemphasizedSelectedContentBackgroundColor)
        #endif
    }
}

public enum AppearanceType: Equatable {
    case solid(color: Color = SkeletonColor.primary, background: Color = SkeletonColor.background)
    case gradient(GradientType = .linear, color: Color = SkeletonColor.primary, background: Color = SkeletonColor.background, radius: CGFloat = 1, angle: Angle = .zero)
    
    @ViewBuilder
    func type(_ phase: CGFloat) -> some View {
        switch self {
        case let .solid(color, background):
            LinearGradient(colors: [color.opacity(phase)], startPoint: .leading, endPoint: .trailing)
                .background(background)
        case let .gradient(.linear, color, background, radius, angle):
            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .clear, location: phase),
                                                      Gradient.Stop(color: color.opacity(phase), location: phase + 0.25),
                                                      Gradient.Stop(color: .clear, location: phase + 0.5)]),
                           startPoint: UnitPoint(x: -radius * cos(angle.radians), y: -radius * sin(angle.radians)),
                           endPoint: UnitPoint(x: radius * cos(angle.radians), y: radius * sin(angle.radians)))
                .background(background)
        case let .gradient(.radial, color, background, _, _):
            RadialGradient(gradient: Gradient(stops: [Gradient.Stop(color: .clear, location: phase),
                                                      Gradient.Stop(color: color.opacity(phase), location: phase + 0.25),
                                                      Gradient.Stop(color: .clear, location: phase + 0.5)]),
                           center: .center, startRadius: .zero, endRadius: 50)
                .background(background)
        case let .gradient(.angular, color, background, _, _):
            AngularGradient(gradient: Gradient(stops: [Gradient.Stop(color: .clear, location: phase),
                                                       Gradient.Stop(color: color.opacity(phase), location: phase + 0.25),
                                                       Gradient.Stop(color: .clear, location: phase + 0.5)]),
                            center: .center, startAngle: .zero, endAngle: .degrees(360))
                .background(background)
        }
    }
}

private extension Color {
    func opacity(_ phase: CGFloat) -> Color {
        opacity(Double(phase <= 0.5 ? phase / 0.5 : (1 - phase) / 0.5))
    }
}
