#if arch(x86_64) || arch(arm64)

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Optional: OptionalType {
    public var wrapped: Wrapped? {
        self
    }
}

#endif
