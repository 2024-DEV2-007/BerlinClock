
import SwiftUI

struct LampView: View {
  let color: Color
  
  var body: some View {
    
    Rectangle()
      .frame(width: LampSize.lampWidth, height: LampSize.lampHeight)
      .foregroundColor(color)
  }
}
