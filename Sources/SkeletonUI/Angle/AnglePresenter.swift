#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class AnglePresenter: ObservableObject {
    @Published var animation: Animation?
    @Published var value: Double = .zero
    @Published var range: ClosedRange<Double> = .zero ... 360
}

#endif
