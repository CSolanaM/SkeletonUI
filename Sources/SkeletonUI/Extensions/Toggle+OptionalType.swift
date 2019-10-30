import SwiftUI

public extension Toggle where Label: View {
    init(isOn: Binding<Bool>?, @ViewBuilder label: () -> Label) {
        if let isOn = isOn {
            self.init(isOn: isOn, label: label)
        } else {
            self.init(isOn: Binding.constant(Bool()), label: label)
        }
    }
}

public extension Toggle where Label == Text {
    init(_ titleKey: LocalizedStringKey?, isOn: Binding<Bool>) {
        if let titleKey = titleKey {
            self.init(titleKey, isOn: isOn)
        } else {
            self.init(String(), isOn: isOn)
        }
    }

    init<S>(_ title: S?, isOn: Binding<Bool>) where S: OptionalType, S.Wrapped: StringProtocol {
        if let title = title?.wrapped {
            self.init(title, isOn: isOn)
        } else {
            self.init(String(), isOn: isOn)
        }
    }
}
