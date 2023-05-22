#if arch(x86_64) || arch(arm64)

import Combine
import SwiftUI

// sourcery: AutoMockable
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
protocol MultilineInteractable: AnyObject {
    var presenter: MultilinePresenter { get }
    var line: CurrentValueSubject<Int, Never> { get }
    var lines: CurrentValueSubject<Int, Never> { get }
    var scale: CurrentValueSubject<CGFloat, Never> { get }
    var spacing: CurrentValueSubject<CGFloat?, Never> { get }
    var scales: CurrentValueSubject<[Int: CGFloat]?, Never> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class MultilineInteractor: MultilineInteractable {
    let presenter = MultilinePresenter()
    let line: CurrentValueSubject<Int, Never>
    let lines: CurrentValueSubject<Int, Never>
    let scale: CurrentValueSubject<CGFloat, Never>
    let spacing: CurrentValueSubject<CGFloat?, Never>
    let scales: CurrentValueSubject<[Int: CGFloat]?, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        line = CurrentValueSubject<Int, Never>(presenter.line)
        lines = CurrentValueSubject<Int, Never>(presenter.lines)
        scale = CurrentValueSubject<CGFloat, Never>(presenter.scale)
        spacing = CurrentValueSubject<CGFloat?, Never>(presenter.spacing)
        scales = CurrentValueSubject<[Int: CGFloat]?, Never>(presenter.scales)
        line.map { [weak self] line in
            guard let self = self else { fatalError() }
            if let scale = self.scales.value?[line] {
                return scale
            }
            return 1
        }.assign(to: \.scale, on: presenter).store(in: &cancellables)
        lines.assign(to: \.lines, on: presenter).store(in: &cancellables)
        scales.assign(to: \.scales, on: presenter).store(in: &cancellables)
        spacing.assign(to: \.spacing, on: presenter).store(in: &cancellables)
    }
}

#endif
