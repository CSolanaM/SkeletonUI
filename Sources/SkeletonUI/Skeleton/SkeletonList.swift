import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonList<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
    private let data: Data
    private let quantity: Int
    private let content: (Bool, Data.Element?) -> Content

    public init(with data: Data, quantity: Int = 1, content: @escaping (Bool, Data.Element?) -> Content) {
        self.data = data
        self.quantity = quantity
        self.content = content
    }

    public var body: some View {
        List(0 ..< (data.isEmpty ? quantity : data.count), id: \.self) { index in
            self.content(self.data.isEmpty, self.data.isEmpty ? nil : self.data.map { $0 }[index])
        }
    }
}
