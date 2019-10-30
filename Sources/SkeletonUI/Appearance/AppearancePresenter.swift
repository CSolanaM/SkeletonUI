import SwiftUI

final class AppearancePresenter: ObservableObject {
    @Published var type: AppearanceType = .gradient()
}
