import SwiftUI

final class SkeletonPresenter: ObservableObject {
    @Published var loading: Bool
    @Published var transition: AnyTransition
    @Published var animated: Animation
    @Published var fixedSize: CGSize?

    init(_ loading: Bool, transition: AnyTransition?, animated: Animation?, fixedSize: CGSize?) {
        self.loading = loading
        self.transition = transition ?? .opacity
        self.animated = animated ?? .default
        self.fixedSize = fixedSize
    }
}
