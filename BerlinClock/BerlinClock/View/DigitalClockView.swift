
import SwiftUI

struct DigitalClockView: View {
  @Binding var currentTime: String
  
  var body: some View {
    VStack {
      Text(self.currentTime)
        .font(.system(size: 48,
                      weight: .bold,
                      design: .default))
        .padding()
    }
  }
}
