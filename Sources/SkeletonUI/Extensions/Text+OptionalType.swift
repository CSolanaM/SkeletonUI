#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension Text {
    init<S>(_ content: S?) where S: OptionalType, S.Wrapped: StringProtocol {
        if let content = content?.wrapped {
            self.init(content)
        } else {
            self.init(String())
        }
    }

    init(_ key: LocalizedStringKey?, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) {
        if let key = key {
            self.init(key, tableName: tableName, bundle: bundle, comment: comment)
        } else {
            self.init(LocalizedStringKey(String()), tableName: tableName, bundle: bundle, comment: comment)
        }
    }

    init(verbatim content: String?) {
        if let content = content {
            self.init(verbatim: content)
        } else {
            self.init(verbatim: String())
        }
    }
}

#endif
