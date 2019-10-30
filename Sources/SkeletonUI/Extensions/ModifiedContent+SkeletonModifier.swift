import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension ModifiedContent where Content: View, Modifier == SkeletonModifier {
    func animation(type: AnimationType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.animation.type.send(type)
        return self
    }

    func appearance(type: AppearanceType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.appearance.type.send(type)
        return self
    }

    func multiline(lines: Int, scales: [Int: CGFloat]? = nil, spacing: CGFloat? = nil) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.multiline.lines.send(lines)
        modifier.skeleton.multiline.scales.send(scales)
        modifier.skeleton.multiline.spacing.send(spacing)
        return self
    }

    func shape(type: ShapeType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.shape.type.send(type)
        return self
    }
}
