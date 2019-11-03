import Combine
import SwiftUI

// sourcery: AutoMockable
protocol SkeletonInteractable: AnyObject {
    var presenter: SkeletonPresenter { get }
    var shape: ShapeInteractable { get }
    var multiline: MultilineInteractable { get }
    var appearance: AppearanceInteractable { get }
    var animation: AnimationInteractable { get }
}

final class SkeletonInteractor: SkeletonInteractable {
    let presenter: SkeletonPresenter
    let shape: ShapeInteractable
    let multiline: MultilineInteractable
    let appearance: AppearanceInteractable
    let animation: AnimationInteractable

    init(_ loading: Bool, transition: AnyTransition?, animated: Animation?, shape: ShapeInteractable = ShapeInteractor(), multiline: MultilineInteractable = MultilineInteractor(), appearance: AppearanceInteractable = AppearanceInteractor(), animation: AnimationInteractable = AnimationInteractor()) {
        presenter = SkeletonPresenter(loading, transition: transition, animated: animated)
        self.shape = shape
        self.multiline = multiline
        self.appearance = appearance
        self.animation = animation
    }
}
