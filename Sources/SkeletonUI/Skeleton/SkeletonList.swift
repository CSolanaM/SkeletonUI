import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonList<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
    private let loading: Bool
    private let data: [Data.Element]
    private let quantity: Int
    private let content: (Bool, Data.Element?) -> Content

    public init(with data: Data, quantity: Int = 1, @ViewBuilder content: @escaping (Bool, Data.Element?) -> Content) {
        loading = data.isEmpty
        self.data = data.map { $0 }
        self.quantity = quantity
        self.content = content
    }

    public var body: some View {
        Group {
            if loading {
                List {
                    ForEach(0 ..< quantity) { _ in
                        self.content(self.loading, nil)
                    }
                }
            } else {
                List(data) { element in
                    self.content(self.loading, element)
                }
            }
        }
    }
}
