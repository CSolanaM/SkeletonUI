import Combine
import SwiftUI

public enum AnimationType: Equatable {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 2, delay: Double = 1, speed: Double = 2, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 4, delay: Double = 1, speed: Double = 5, autoreverses: Bool = false)
}

// sourcery: AutoMockable
protocol AnimationInteractable: AnyObject {
    var position: PositionInteractable { get }
    var opacity: OpacityInteractable { get }
    var radius: RadiusInteractable { get }
    var angle: AngleInteractable { get }
    var type: CurrentValueSubject<AnimationType, Never> { get }
}

final class AnimationInteractor: AnimationInteractable {
    let position: PositionInteractable
    let opacity: OpacityInteractable
    let radius: RadiusInteractable
    let angle: AngleInteractable
    let type: CurrentValueSubject<AnimationType, Never>

    private var cancellables = Set<AnyCancellable>()

    init(position: PositionInteractable = PositionInteractor(), opacity: OpacityInteractable = OpacityInteractor(), radius: RadiusInteractable = RadiusInteractor(), angle: AngleInteractable = AngleInteractor()) {
        self.position = position
        self.opacity = opacity
        self.radius = radius
        self.angle = angle
        type = CurrentValueSubject<AnimationType, Never>(.linear())
        type.sink { [weak self] type in
            switch type {
            case .none:
                break
            case let .pulse(opacity, duration, delay, speed, autoreverses):
                self?.opacity.range.send(opacity)
                self?.opacity.animation.send(Animation.easeIn(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses))
            case let .linear(range, duration, delay, speed, autoreverses):
                position.range.send(position.presenter.range.normalize(with: range))
                radius.range.send(radius.presenter.range.normalize(with: range))
                angle.range.send(angle.presenter.range.normalize(with: range))
                position.animation.send(Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses))
                opacity.animation.send(autoreverses ? nil : Animation.easeIn(duration: duration).delay(delay).speed(speed * 2).repeatForever(autoreverses: true))
                radius.animation.send(Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses))
                angle.animation.send(Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses))
            }
        }.store(in: &cancellables)
    }
}
