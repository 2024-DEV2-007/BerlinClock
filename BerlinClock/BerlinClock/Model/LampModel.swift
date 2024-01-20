
import SwiftUI

struct Lamp: Equatable {
  var color: LampColor
  var isOn: Bool
}

enum LampColor {
  case berlinYellow
  case berlinRed
  case berlinGray
  
  var uiColor: Color {
    switch self {
    case .berlinYellow:
      return .berlinYellow
    case .berlinRed:
      return .berlinRed
    case .berlinGray:
      return .berlinGray
    }
  }
}
