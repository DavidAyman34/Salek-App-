// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Library3Am {
    internal static let regular = FontConvertible(name: "LIBRARY3AM", family: "LIBRARY 3 AM", path: "Library 3 am.otf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal enum LIBRARY3AMSoft {
    internal static let regular = FontConvertible(name: "LIBRARY3AMsoft", family: "LIBRARY 3 AM soft", path: "Library 3 am soft.otf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal enum Nunito {
    internal static let bold = FontConvertible(name: "Nunito-Bold", family: "Nunito", path: "Nunito Bold.ttf")
    internal static let light = FontConvertible(name: "Nunito-Light", family: "Nunito", path: "Nunito Light.ttf")
    internal static let regular = FontConvertible(name: "Nunito-Regular", family: "Nunito", path: "nunito-regular_[allfont.net].ttf")
    internal static let semiBold = FontConvertible(name: "Nunito-SemiBold", family: "Nunito", path: "Nunito-SemiBold.ttf")
    internal static let all: [FontConvertible] = [bold, light, regular, semiBold]
  }
  internal static let allCustomFonts: [FontConvertible] = [Library3Am.all, LIBRARY3AMSoft.all, Nunito.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

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
