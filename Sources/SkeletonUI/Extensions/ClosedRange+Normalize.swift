#if arch(x86_64) || arch(arm64)

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ClosedRange where Bound == CGFloat {
    func normalize(with range: ClosedRange) -> ClosedRange {
        let lowerBound = range.lowerBound == .zero ? self.lowerBound : range.lowerBound
        let upperBound = range.upperBound == 1 ? self.upperBound : range.upperBound
        return lowerBound < upperBound ? lowerBound ... upperBound : self
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ClosedRange where Bound == Double {
    func normalize(with range: ClosedRange<CGFloat>) -> ClosedRange {
        let normalized = (CGFloat(lowerBound) ... CGFloat(upperBound)).normalize(with: range)
        return Double(normalized.lowerBound) ... Double(normalized.upperBound)
    }
}

#endif
