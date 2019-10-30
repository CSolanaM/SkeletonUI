import Combine
import SwiftUI

// sourcery: AutoMockable
protocol PositionInteractable: AnyObject {
    var presenter: PositionPresenter { get }
    var animation: CurrentValueSubject<Animation?, Never> { get }
    var value: CurrentValueSubject<CGFloat, Never> { get }
    var range: CurrentValueSubject<ClosedRange<CGFloat>, Never> { get }
}

final class PositionInteractor: PositionInteractable {
    let presenter = PositionPresenter()
    let animation: CurrentValueSubject<Animation?, Never>
    let value: CurrentValueSubject<CGFloat, Never>
    let range: CurrentValueSubject<ClosedRange<CGFloat>, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        value = CurrentValueSubject<CGFloat, Never>(presenter.value)
        animation = CurrentValueSubject<Animation?, Never>(presenter.animation)
        range = CurrentValueSubject<ClosedRange<CGFloat>, Never>(presenter.range)
        range.assign(to: \.range, on: presenter).store(in: &cancellables)
        value.assign(to: \.value, on: presenter).store(in: &cancellables)
        animation.assign(to: \.animation, on: presenter).store(in: &cancellables)
        range.map { $0.lowerBound }.assign(to: \.value, on: presenter).store(in: &cancellables)
    }
}
