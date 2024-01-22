
import SwiftUI

struct BerlinClockRow: View {
  @Binding var lamps: [Lamp]
  
  var body: some View {
    HStack(spacing: 5) {
      ForEach(0..<lamps.count) { index in
        LampView(isOn: self.lamps[index].isOn,
                 color: self.lamps[index].color.uiColor)
      }
    }
  }
}

