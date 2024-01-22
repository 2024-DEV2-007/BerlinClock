
import SwiftUI

struct LampView: View {
  let isOn: Bool
  let color: Color
  
  var body: some View {
    
    Rectangle()
      .frame(width: 20, height: 20)
      .foregroundColor(color)
  }
}
