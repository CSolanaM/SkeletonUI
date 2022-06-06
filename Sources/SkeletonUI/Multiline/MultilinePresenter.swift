#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class MultilinePresenter: ObservableObject {
    @Published var line: Int = 0
    @Published var lines: Int = 1
    @Published var spacing: CGFloat?
    @Published var scale: CGFloat = 1
    @Published var scales: [Int: CGFloat]?
}

#endif
