import CoreGraphics

extension ClosedRange where Bound == CGFloat {
    func normalize(with range: ClosedRange) -> ClosedRange {
        let lowerBound = range.lowerBound == .zero ? self.lowerBound : range.lowerBound
        let upperBound = range.upperBound == 1 ? self.upperBound : range.upperBound
        return lowerBound < upperBound ? lowerBound ... upperBound : self
    }
}

extension ClosedRange where Bound == Double {
    func normalize(with range: ClosedRange<CGFloat>) -> ClosedRange {
        let normalized = (CGFloat(lowerBound) ... CGFloat(upperBound)).normalize(with: range)
        return Double(normalized.lowerBound) ... Double(normalized.upperBound)
    }
}
