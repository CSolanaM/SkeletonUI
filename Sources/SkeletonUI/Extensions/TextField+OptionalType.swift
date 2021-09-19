import SwiftUI

public extension TextField where Label == Text {
    init(titleKey: LocalizedStringKey?, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        if let titleKey = titleKey {
            self.init(titleKey, text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
        } else {
            self.init(LocalizedStringKey(String()), text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
        }
    }

    init<S>(_ title: S?, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S: OptionalType, S.Wrapped: StringProtocol {
        if let title = title?.wrapped {
            self.init(title, text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
        } else {
            self.init(String(), text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
        }
    }

    init<T>(titleKey: LocalizedStringKey?, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        if let titleKey = titleKey {
            self.init(titleKey, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        } else {
            self.init(LocalizedStringKey(String()), value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        }
    }

    init<S, T>(_ title: S?, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S: OptionalType, S.Wrapped: StringProtocol {
        if let title = title?.wrapped {
            self.init(title, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        } else {
            self.init(String(), value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        }
    }
}
