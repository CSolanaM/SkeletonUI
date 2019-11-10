import Combine
import SkeletonUI
import SnapshotTesting
import SwiftUI
import XCTest

extension String: Identifiable {
    public var id: UUID {
        UUID()
    }
}

final class SnapshotTests: XCTestCase {
    func testDefaultText() {
        let view = Text(nil).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }

    func testDefaultImage() {
        #if os(macOS)
            let view = Image(nsImage: nil).skeleton(with: true)
        #else
            let view = Image(uiImage: nil).skeleton(with: true)
        #endif
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 100)))
    }

    func testDefaultTextField() {
        let view = TextField(nil, text: Binding.constant(String())).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }

    func testDefaultToggle() {
        let view = Toggle(nil, isOn: Binding.constant(false)).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }

    // TODO: @CSolanaM Fix test failing on the CI
//    func testDefaultSkeletonList() {
//        let view = SkeletonList(with: [#function]) { loading, item in
//            Text(item).skeleton(with: loading)
//        }
//        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 25)))
//    }

    func testLoadingSkeletonList() {
        let view = SkeletonList(with: [String]()) { loading, item in
            Text(item).skeleton(with: loading)
        }
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 25)))
    }

    func testCustomText() {
        let view = Text(nil).skeleton(with: true).appearance(type: .solid()).shape(type: .rectangle).multiline(lines: 2, scales: [1: 0.5]).animation(type: .pulse())
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }

    func testCustomImage() {
        #if os(macOS)
            let view = Image("checkmark").skeleton(with: true).shape(type: .circle).animation(type: .none)
        #else
            let view = Image(systemName: "checkmark").skeleton(with: true).appearance(type: .gradient()).shape(type: .circle).animation(type: .none)
        #endif
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 100)))
    }

    func testCustomTextField() {
        let view = TextField(nil, text: Binding.constant(String())).skeleton(with: true).appearance(type: .gradient(.angular)).shape(type: .ellipse)
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }

    func testCustomToggle() {
        let view = Toggle(nil, isOn: Binding.constant(false)).skeleton(with: true).appearance(type: .gradient(.radial)).shape(type: .rounded(.radius(10)))
        assertNamedSnapshot(matching: view, as: .image(size: CGSize(width: 100, height: 50)))
    }
}
