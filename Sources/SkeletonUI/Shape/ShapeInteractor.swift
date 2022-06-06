#if arch(x86_64) || arch(arm64)

import Combine
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum RoundedType: Equatable {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ShapeType: Equatable {
    case rounded(RoundedType)
    case rectangle
    case circle
    case ellipse
    case capsule
}

// sourcery: AutoMockable
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
protocol ShapeInteractable: AnyObject {
    var presenter: ShapePresenter { get }
    var type: CurrentValueSubject<ShapeType, Never> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class ShapeInteractor: ShapeInteractable {
    let presenter = ShapePresenter()
    let type: CurrentValueSubject<ShapeType, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        type = CurrentValueSubject<ShapeType, Never>(presenter.type)
        type.assign(to: \.type, on: presenter).store(in: &cancellables)
    }
}

#endif
