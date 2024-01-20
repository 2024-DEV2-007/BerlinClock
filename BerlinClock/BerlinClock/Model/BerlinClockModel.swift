
import Foundation

struct BerlinClockModel {
  var secondsLamps: [Lamp] = [Lamp(color: .gray, isOn: false)]
  
  mutating func updateSecondsLamps(for seconds: Int) {
    let isOn = seconds % 2 == 0
    let color: LampColor = isOn ? .yellow : .gray
    secondsLamps = [Lamp(color: color, isOn: isOn)]
  }
}
