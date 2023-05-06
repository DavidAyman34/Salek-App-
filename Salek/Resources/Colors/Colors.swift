// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4756ca"></span>
  /// Alpha: 100% <br/> (0x4756caff)
  internal static let blue = ColorName(rgbaValue: 0x4756caff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#474eca"></span>
  /// Alpha: 100% <br/> (0x474ecaff)
  internal static let bluepurp = ColorName(rgbaValue: 0x474ecaff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#aa0033"></span>
  /// Alpha: 100% <br/> (0xaa0033ff)
  internal static let cannary = ColorName(rgbaValue: 0xaa0033ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001867"></span>
  /// Alpha: 100% <br/> (0x001867ff)
  internal static let commonButton = ColorName(rgbaValue: 0x001867ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#28df99"></span>
  /// Alpha: 100% <br/> (0x28df99ff)
  internal static let green = ColorName(rgbaValue: 0x28df99ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bbe1fa"></span>
  /// Alpha: 100% <br/> (0xbbe1faff)
  internal static let lightBlue = ColorName(rgbaValue: 0xbbe1faff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f7f5f5"></span>
  /// Alpha: 100% <br/> (0xf7f5f5ff)
  internal static let lightWhite = ColorName(rgbaValue: 0xf7f5f5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#163172"></span>
  /// Alpha: 100% <br/> (0x163172ff)
  internal static let lightnavy = ColorName(rgbaValue: 0x163172ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#848585"></span>
  /// Alpha: 100% <br/> (0x848585ff)
  internal static let steelGrey = ColorName(rgbaValue: 0x848585ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cccccc"></span>
  /// Alpha: 100% <br/> (0xccccccff)
  internal static let veryLightPink = ColorName(rgbaValue: 0xccccccff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let white = ColorName(rgbaValue: 0xffffffff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map { CGFloat($0 & 0xff) }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
