#if arch(x86_64) || arch(arm64)

import Combine
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum GradientType: Equatable {
    case linear
    case angular
    case radial
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonColor {
    public static var primary: Color {
        #if os(iOS)
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
        #if os(iOS)
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

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum AppearanceType: Equatable {
    case solid(color: Color = SkeletonColor.primary, background: Color = SkeletonColor.background)
    case gradient(GradientType = .linear, color: Color = SkeletonColor.primary, background: Color = SkeletonColor.background, radius: CGFloat = 1, angle: CGFloat = .zero)
}

// sourcery: AutoMockable
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
protocol AppearanceInteractable: AnyObject {
    var presenter: AppearancePresenter { get }
    var type: CurrentValueSubject<AppearanceType, Never> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class AppearanceInteractor: AppearanceInteractable {
    let presenter = AppearancePresenter()
    let type: CurrentValueSubject<AppearanceType, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        type = CurrentValueSubject<AppearanceType, Never>(presenter.type)
        type.assign(to: \.type, on: presenter).store(in: &cancellables)
    }
}

#endif
