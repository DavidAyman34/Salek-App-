// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let checkbutton = ImageAsset(name: "Checkbutton")
  internal static let component1411 = ImageAsset(name: "component_14_1-1")
  internal static let component141 = ImageAsset(name: "component_14_1")
  internal static let component1511 = ImageAsset(name: "component_15_1-1")
  internal static let component151 = ImageAsset(name: "component_15_1")
  internal static let component1611 = ImageAsset(name: "component_16_1-1")
  internal static let component161 = ImageAsset(name: "component_16_1")
  internal static let component1711 = ImageAsset(name: "component_17_1-1")
  internal static let component171 = ImageAsset(name: "component_17_1")
  internal static let component311 = ImageAsset(name: "component_3_1-1")
  internal static let component312 = ImageAsset(name: "component_3_1-2")
  internal static let component31 = ImageAsset(name: "component_3_1")
  internal static let component411 = ImageAsset(name: "component_4_1-1")
  internal static let component41 = ImageAsset(name: "component_4_1")
  internal static let component51 = ImageAsset(name: "component_5_1")
  internal static let component611 = ImageAsset(name: "component_6_1-1")
  internal static let component61 = ImageAsset(name: "component_6_1")
  internal static let ss = ImageAsset(name: "ss")
  internal static let unCheckBtn = ImageAsset(name: "unCheckBtn")
  internal static let codeImge = ImageAsset(name: "codeImge")
  internal static let forgatePass = ImageAsset(name: "forgatePass")
  internal static let resetPass = ImageAsset(name: "resetPass")
  internal static let individualAddress = ImageAsset(name: "IndividualAddress")
  internal static let individualInformation = ImageAsset(name: "IndividualInformation")
  internal static let component221 = ImageAsset(name: "component_22_1")
  internal static let component251 = ImageAsset(name: "component_25_1")
  internal static let address1 = ImageAsset(name: "Address-1")
  internal static let address = ImageAsset(name: "Address")
  internal static let currentLocation = ImageAsset(name: "Current location")
  internal static let daco752371 = ImageAsset(name: "Daco_752371")
  internal static let logo2 = ImageAsset(name: "Logo-2")
  internal static let logo = ImageAsset(name: "Logo")
  internal static let unknown = ImageAsset(name: "Unknown")
  internal static let addr = ImageAsset(name: "addr")
  internal static let arrow = ImageAsset(name: "arrow")
  internal static let back21 = ImageAsset(name: "back2-1")
  internal static let back2 = ImageAsset(name: "back2")
  internal static let component1112 = ImageAsset(name: "component_11_12")
  internal static let component71 = ImageAsset(name: "component_7_1")
  internal static let details = ImageAsset(name: "details")
  internal static let infoBtn = ImageAsset(name: "infoBtn")
  internal static let leftArrow2 = ImageAsset(name: "left-arrow-2")
  internal static let leftArrow = ImageAsset(name: "left-arrow")
  internal static let locationMark = ImageAsset(name: "locationMark")
  internal static let outputOnlinepngtools = ImageAsset(name: "output-onlinepngtools")
  internal static let store = ImageAsset(name: "store")
  internal static let id = ImageAsset(name: "ID")
  internal static let addressIcon = ImageAsset(name: "addressIcon")
  internal static let component191 = ImageAsset(name: "component_19_1")
  internal static let employment = ImageAsset(name: "employment")
  internal static let information = ImageAsset(name: "information")
  internal static let verification = ImageAsset(name: "verification")
  internal static let component111 = ImageAsset(name: "component_1_1-1")
  internal static let component112 = ImageAsset(name: "component_1_1-2")
  internal static let component11 = ImageAsset(name: "component_1_1")
  internal static let component211 = ImageAsset(name: "component_2_1-1")
  internal static let component212 = ImageAsset(name: "component_2_1-2")
  internal static let component21 = ImageAsset(name: "component_2_1")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
