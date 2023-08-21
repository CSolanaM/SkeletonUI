<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./Assets/headerdark.gif">
  <img src="./Assets/header.gif">
</picture>
<p align='center'>
	<img src='https://github.com/CSolanaM/SkeletonUI/workflows/build/badge.svg'>
	<img src='https://github.com/CSolanaM/SkeletonUI/workflows/test/badge.svg'>
        <a href="https://codecov.io/gh/CSolanaM/SkeletonUI"><img src="https://codecov.io/gh/CSolanaM/SkeletonUI/branch/master/graph/badge.svg" /></a>
	<img src='https://img.shields.io/cocoapods/p/SkeletonUI'>
	<img src='https://img.shields.io/github/v/tag/CSolanaM/SkeletonUI?color=lightGray&label=version'>
	<img src='https://img.shields.io/github/license/CSolanaM/SkeletonUI?color=lightGray'>
	<a href='https://twitter.com/CSolanaM'><img src='https://img.shields.io/badge/twitter-@CSolanaM-lightGray.svg?style=flat&label=contact'></a>
</p>

SkeletonUI aims to bring an elegant, declarative syntax to skeleton loading animations. Get rid of loading screens or spinners and start using skeletons to represent final content shapes.

# Requirements :gear:

- macOS 10.15.
- Xcode 11.0.
- Swift 5.0.

# Supported Platforms :iphone:

- iOS 13.0.
- tvOS 13.0.
- watchOS 6.0.
- macOS 10.15.

# Installation :computer:

### Swift Package Manager
[Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. Once you have your Swift package set up, adding `SkeletonUI` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
  dependencies: [
  .package(url: "https://github.com/CSolanaM/SkeletonUI.git", .branch("master"))
  ]
```

### CocoaPods
[CocoaPods](https://cocoapods.org) is a centralized dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SkeletonUI into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SkeletonUI'
```

# Features :sparkles:

- [x] SwiftUI simple, declarative syntax.
- [x] Super easy and simple to set up.
- [x] All Views are skeletonables.
- [x] Fully customizable.
- [x] Universal (iPhone, iPad, iPod, Apple TV, Apple Watch, Mac).
- [x] SwiftUI ViewModifier power.
- [x] Lightweight codebase.

# Usage :rocket:

### Basic one-liner:

```swift
import SkeletonUI
import SwiftUI

struct UsersView: View {
    @State var users = [String]()

    var body: some View {
        Text("Finished requesting \(users.count) users!")
            .skeleton(with: users.isEmpty)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.users = ["John Doe", "Jane Doe", "James Doe", "Judy Doe"]
                }
        }
    }
}
```

### Advanced customization:

```swift
import SkeletonUI
import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
}

struct UsersView: View {
    @State var users = [User]()

    var body: some View {
        SkeletonList(with: users, quantity: 6) { loading, user in
            Text(user?.name)
                .skeleton(with: loading,
                          animation: .pulse(),
                          appearance: .solid(color: .red, background: .blue),
                          shape: .rectangle,
                          lines: 3,
                          scales: [1: 0.5])
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.users = [User(name: "John Doe"),
                              User(name: "Jane Doe"),
                              User(name: "James Doe"),
                              User(name: "Judy Doe")]
            }
        }
    }
}
```

# Change Log :calendar:

See [CHANGELOG.md](https://github.com/CSolanaM/SkeletonUI/blob/master/CHANGELOG.md) for details.

# Contributing :tada:

- Suggest your idea as a [feature request](https://github.com/CSolanaM/SkeletonUI/issues/new?assignees=&labels=&template=feature_request.md&title=) for this project.
- Create a [bug report](https://github.com/CSolanaM/SkeletonUI/issues/new?assignees=&labels=&template=bug_report.md&title=) to help us improve.
- Propose your own fixes, suggestions and open a pull request with the changes.

See [CONTRIBUTING.md](https://github.com/CSolanaM/SkeletonUI/blob/master/CONTRIBUTING.md) for details.

# Code of Conduct :speech_balloon:

See [CODE_OF_CONDUCT.md](https://github.com/CSolanaM/SkeletonUI/blob/master/CODE_OF_CONDUCT.md) for details.

# Credits :speak_no_evil:

SkeletonUI is owned and maintained by [CSolanaM](https://csolanam.io). You can follow me on Twitter at [@CSolanaM](https://twitter.com/CSolanaM) or contact me via [email](mailto:apps@csolanam.io) for project updates and releases.

# License :mortar_board:

SkeletonUI is released under the MIT license. See [LICENSE](https://github.com/CSolanaM/SkeletonUI/blob/master/LICENSE) for details.
