import SwiftUI

struct SkeletonShape: Shape {
    let shape: ShapeType

    init(_ shape: ShapeType) {
        self.shape = shape
    }

    func path(in rect: CGRect) -> Path {
        shape.type.path(in: rect)
    }
}
