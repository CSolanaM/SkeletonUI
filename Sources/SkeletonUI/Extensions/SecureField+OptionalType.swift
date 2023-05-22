#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
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

#endif
