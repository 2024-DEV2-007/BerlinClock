
import Foundation

struct BerlinClockModel: Equatable {
  var secondsLamps: [Lamp] = [Lamp(color: .gray, isOn: false)]
  var upperHoursLamps: [Lamp] = Array(repeating: Lamp(color: .gray, isOn: false), count: 4)
  var lowerHoursLamps: [Lamp] = Array(repeating: Lamp(color: .gray, isOn: false), count: 4)
  
  mutating func updateSecondsLamps(for seconds: Int) {
    let isOn = seconds % 2 == 0
    let color: LampColor = isOn ? .yellow : .gray
    secondsLamps = [Lamp(color: color, isOn: isOn)]
  }
  
  mutating func updateUppperRowHoursLamps(for hours: Int) {
    let topHours = (min(4, hours / 5))
    upperHoursLamps = Array(repeating: Lamp(color: .red, isOn: true), count: topHours) + Array(repeating: Lamp(color: .gray, isOn: false), count: max(0, 4 - topHours))
  }
  
  mutating func updateLowerRowHoursLamps(for hours: Int) {
    // Calculate the remainder when dividing hours by 5 to get the bottom hours
    let lowerHours = hours % 5
    lowerHoursLamps = Array(repeating: Lamp(color: .red, isOn: true), count: lowerHours) + Array(repeating: Lamp(color: .gray, isOn: false), count: max(0, 4 - lowerHours))
  }
}
