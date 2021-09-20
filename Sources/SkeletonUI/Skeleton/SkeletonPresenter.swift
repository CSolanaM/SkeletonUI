import SwiftUI

final class SkeletonPresenter: ObservableObject {
    @Published var loading: Bool
    @Published var transition: AnyTransition
    @Published var animated: Animation
    @Published var width: CGFloat?
    @Published var height: CGFloat?

    init(_ loading: Bool, transition: AnyTransition?, animated: Animation?, width: CGFloat?, height: CGFloat?) {
        self.loading = loading
        self.transition = transition ?? .opacity
        self.animated = animated ?? .default
        self.width = width
        self.height = height
    }
}
