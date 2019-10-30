import SwiftUI

final class ShapePresenter: ObservableObject {
    @Published var type: ShapeType = .capsule
}
