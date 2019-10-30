import Combine
import SwiftUI

public enum RoundedType: Equatable {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
}

public enum ShapeType: Equatable {
    case rounded(RoundedType)
    case rectangle
    case circle
    case ellipse
    case capsule
}

// sourcery: AutoMockable
protocol ShapeInteractable: AnyObject {
    var presenter: ShapePresenter { get }
    var type: CurrentValueSubject<ShapeType, Never> { get }
}

final class ShapeInteractor: ShapeInteractable {
    let presenter = ShapePresenter()
    let type: CurrentValueSubject<ShapeType, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        type = CurrentValueSubject<ShapeType, Never>(presenter.type)
        type.assign(to: \.type, on: presenter).store(in: &cancellables)
    }
}
