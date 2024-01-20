
import SwiftUI

struct Lamp {
  var color: LampColor
  var isOn: Bool
}

enum LampColor {
  case yellow
  case red
  case gray
  
  var uiColor: Color {
    switch self {
    case .yellow:
      return .yellow
    case .red:
      return .red
    case .gray:
      return .gray
    }
  }
}
