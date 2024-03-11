import SwiftUI

public extension Image {
    #if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
        init(uiImage: UIImage?) {
            if let uiImage = uiImage {
                self.init(uiImage: uiImage)
            } else {
                self.init(uiImage: UIImage())
            }
        }

    #elseif os(macOS)
        init(nsImage: NSImage?) {
            if let nsImage = nsImage {
                self.init(nsImage: nsImage)
            } else {
                self.init(nsImage: NSImage())
            }
        }
    #endif

    init(_ name: String?, bundle: Bundle? = nil) {
        if let name = name {
            self.init(name, bundle: bundle)
        } else {
            self.init(String(), bundle: bundle)
        }
    }

    init(_ name: String?, bundle: Bundle? = nil, label: Text) {
        if let name = name {
            self.init(name, bundle: bundle, label: label)
        } else {
            self.init(String(), bundle: bundle, label: label)
        }
    }

    init(decorative name: String?, bundle: Bundle? = nil) {
        if let name = name {
            self.init(decorative: name, bundle: bundle)
        } else {
            self.init(decorative: String(), bundle: bundle)
        }
    }

    #if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
        init(systemName: String?) {
            if let systemName = systemName {
                self.init(systemName: systemName)
            } else {
                self.init(systemName: String())
            }
        }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
        init(_ cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) {
            if let cgImage = cgImage {
                self.init(cgImage, scale: scale, orientation: orientation, label: label)
            } else if let image = UIImage().cgImage {
                self.init(image, scale: scale, orientation: orientation, label: label)
            } else {
                self.init(String())
            }
        }

    #elseif os(macOS)
        init(_ cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) {
            if let cgImage = cgImage {
                self.init(cgImage, scale: scale, orientation: orientation, label: label)
            } else if let image = NSImage().cgImage(forProposedRect: nil, context: nil, hints: nil) {
                self.init(image, scale: scale, orientation: orientation, label: label)
            } else {
                self.init(String())
            }
        }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
        init(decorative cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up) {
            if let cgImage = cgImage {
                self.init(decorative: cgImage, scale: scale, orientation: orientation)
            } else if let image = UIImage().cgImage {
                self.init(decorative: image, scale: scale, orientation: orientation)
            } else {
                self.init(String())
            }
        }

    #elseif os(macOS)
        init(decorative cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up) {
            if let cgImage = cgImage {
                self.init(decorative: cgImage, scale: scale, orientation: orientation)
            } else if let image = NSImage().cgImage(forProposedRect: nil, context: nil, hints: nil) {
                self.init(decorative: image, scale: scale, orientation: orientation)
            } else {
                self.init(String())
            }
        }
    #endif
}
