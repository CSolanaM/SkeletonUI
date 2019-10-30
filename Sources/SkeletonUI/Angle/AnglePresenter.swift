import SwiftUI

final class AnglePresenter: ObservableObject {
    @Published var animation: Animation?
    @Published var value: Double = .zero
    @Published var range: ClosedRange<Double> = .zero ... 360
}
