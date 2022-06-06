#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class SkeletonPresenter: ObservableObject {
    @Published var loading: Bool
    @Published var size: CGSize?
    @Published var transition: AnyTransition
    @Published var animated: Animation

    init(_ loading: Bool, size: CGSize?, transition: AnyTransition?, animated: Animation?) {
        self.loading = loading
        self.size = size
        self.transition = transition ?? .opacity
        self.animated = animated ?? .default
    }
}

#endif
