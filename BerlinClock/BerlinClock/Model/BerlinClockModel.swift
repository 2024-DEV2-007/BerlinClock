
import Foundation

struct BerlinClockModel {
  var secondsLamps: [Lamp] = [Lamp(color: .gray, isOn: false)]
  
  mutating func updateSecondsLamps(for seconds: Int) {
    let isOn = seconds % 2 == 0
    secondsLamps = [Lamp(color: .yellow, isOn: isOn)]
  }
}
