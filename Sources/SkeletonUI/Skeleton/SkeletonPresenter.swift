import SwiftUI

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
