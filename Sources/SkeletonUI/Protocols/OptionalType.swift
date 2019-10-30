public protocol OptionalType {
    associatedtype Wrapped
    var wrapped: Wrapped? { get }
}
