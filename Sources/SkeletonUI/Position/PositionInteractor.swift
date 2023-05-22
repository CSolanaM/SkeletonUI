#if arch(x86_64) || arch(arm64)

import Combine
import SwiftUI

// sourcery: AutoMockable
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
protocol PositionInteractable: AnyObject {
    var presenter: PositionPresenter { get }
    var animation: CurrentValueSubject<Animation?, Never> { get }
    var value: CurrentValueSubject<CGFloat, Never> { get }
    var range: CurrentValueSubject<ClosedRange<CGFloat>, Never> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
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

#endif
