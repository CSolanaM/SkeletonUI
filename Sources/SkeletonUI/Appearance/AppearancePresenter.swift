#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class AppearancePresenter: ObservableObject {
    @Published var type: AppearanceType = .gradient()
}

#endif
