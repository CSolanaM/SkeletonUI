import SwiftUI

final class SkeletonPresenter: ObservableObject {
    @Published var loading: Bool
    @Published var transition: AnyTransition
    @Published var animated: Animation

    init(_ loading: Bool, transition: AnyTransition?, animated: Animation?) {
        self.loading = loading
        self.transition = transition ?? .opacity
        self.animated = animated ?? .default
    }
}
