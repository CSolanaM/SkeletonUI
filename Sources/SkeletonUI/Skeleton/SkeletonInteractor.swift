import Combine
import SwiftUI

// sourcery: AutoMockable
protocol SkeletonInteractable: AnyObject {
    var shape: ShapeInteractable { get }
    var multiline: MultilineInteractable { get }
    var appearance: AppearanceInteractable { get }
    var animation: AnimationInteractable { get }
    var loading: CurrentValueSubject<Bool, Never> { get }
}

final class SkeletonInteractor: SkeletonInteractable {
    let shape: ShapeInteractable
    let multiline: MultilineInteractable
    let appearance: AppearanceInteractable
    let animation: AnimationInteractable
    let loading: CurrentValueSubject<Bool, Never>

    init(_ loading: Bool, shape: ShapeInteractable = ShapeInteractor(), multiline: MultilineInteractable = MultilineInteractor(), appearance: AppearanceInteractable = AppearanceInteractor(), animation: AnimationInteractable = AnimationInteractor()) {
        self.shape = shape
        self.multiline = multiline
        self.appearance = appearance
        self.animation = animation
        self.loading = CurrentValueSubject<Bool, Never>(loading)
    }
}
