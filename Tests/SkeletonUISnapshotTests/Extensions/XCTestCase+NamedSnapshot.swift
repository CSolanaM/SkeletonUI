import SnapshotTesting
import SwiftUI
import XCTest

#if os(macOS)
    typealias ViewController = NSViewController
    typealias HostingController = NSHostingController

    private let factor: CGFloat! = NSScreen.main?.backingScaleFactor
#else
    typealias ViewController = UIViewController
    typealias HostingController = UIHostingController

    private let factor = UIScreen.main.scale
#endif

extension XCTestCase {
    private var scale: String {
        let scale: Float! = Float(factor)
        return String(Int(scale))
    }

    private var device: String {
        #if os(macOS)
            return ProcessInfo.processInfo.processName
        #else
            return UIDevice.current.model
        #endif
    }

    func assertNamedSnapshot<Value, Format>(matching value: @escaping @autoclosure () throws -> Value, as snapshotting: SnapshotTesting.Snapshotting<ViewController, Format>, record recording: Bool = false, timeout: TimeInterval = 5, file: StaticString = #file, testName: String = #function, line: UInt = #line) where Value: View {
        DispatchQueue.main.async {
            try? ColorScheme.allCases.forEach { scheme in
                let view = try value().colorScheme(scheme)
                let hostingController = HostingController(rootView: view)
                let name = "\(self.device)-\(self.scale)-\(scheme)"
                #if os(macOS)
                    hostingController.view.layer?.backgroundColor = .clear
                #else
                    hostingController.view.backgroundColor = .clear
                #endif
                assertSnapshot(matching: hostingController, as: snapshotting, named: name, record: recording, timeout: timeout, file: file, testName: testName, line: line)
            }
        }
    }
}
