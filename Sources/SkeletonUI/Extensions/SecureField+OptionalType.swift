import SwiftUI

public extension SecureField where Label == Text {
    init(_ titleKey: LocalizedStringKey?, text: Binding<String>, onCommit: @escaping () -> Void = {}) {
        if let titleKey = titleKey {
            self.init(titleKey, text: text, onCommit: onCommit)
        } else {
            self.init(LocalizedStringKey(String()), text: text, onCommit: onCommit)
        }
    }

    init<S>(_ title: S?, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S: OptionalType, S.Wrapped: StringProtocol {
        if let title = title?.wrapped {
            self.init(title, text: text, onCommit: onCommit)
        } else {
            self.init(String(), text: text, onCommit: onCommit)
        }
    }
}
