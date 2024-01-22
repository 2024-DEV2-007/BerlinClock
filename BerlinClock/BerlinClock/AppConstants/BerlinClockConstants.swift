
import SwiftUI

// Berlin Clock Rows
struct BerlinClockConstants {
  static let secondsLampsCount = 1
  static let upperRowHoursLampsCount = 4
  static let lowerRowHoursLampsCount = 4
  static let upperRowMinutesLampsCount = 11
  static let lowerRowMinutesLampsCount = 4
}

// Colors
extension Color {
  static let berlinYellow = Color.yellow
  static let berlinRed = Color.red
  static let berlinGray = Color.gray
}

// Lamp Sizes
enum LampSize {
  static let lampWidth: CGFloat = 20
  static let lampHeight: CGFloat = 20
}
