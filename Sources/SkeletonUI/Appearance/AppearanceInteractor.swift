import Combine
import SwiftUI

public enum GradientType: Equatable {
    case linear
    case angular
    case radial
}

extension Color {
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

public enum AppearanceType: Equatable {
    case solid(color: Color = .primary, background: Color = .background)
    case gradient(GradientType = .linear, color: Color = .primary, background: Color = .background, radius: CGFloat = 1, angle: CGFloat = .zero)
}

// sourcery: AutoMockable
protocol AppearanceInteractable: AnyObject {
    var presenter: AppearancePresenter { get }
    var type: CurrentValueSubject<AppearanceType, Never> { get }
}

final class AppearanceInteractor: AppearanceInteractable {
    let presenter = AppearancePresenter()
    let type: CurrentValueSubject<AppearanceType, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        type = CurrentValueSubject<AppearanceType, Never>(presenter.type)
        type.assign(to: \.type, on: presenter).store(in: &cancellables)
    }
}
