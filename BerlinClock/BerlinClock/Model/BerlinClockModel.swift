
import Foundation

struct BerlinClockModel: Equatable {
  var secondsLamps: [Lamp] = [Lamp(color: .gray, isOn: false)]
  var upperHoursLamps: [Lamp] = Array(repeating: Lamp(color: .gray, isOn: false), count: BerlinClockConstants.upperRowHoursLampsCount)
  var lowerHoursLamps: [Lamp] = Array(repeating: Lamp(color: .gray, isOn: false), count: BerlinClockConstants.lowerRowHoursLampsCount)
  var upperMinutesLamps: [Lamp] = Array(repeating: Lamp(color: .gray, isOn: false), count: BerlinClockConstants.upperRowMinutesLampsCount)
}

extension BerlinClockModel {
    
  mutating func updateSecondsLamps(for seconds: Int) {
    let isOn = seconds % 2 == 0
    let color: LampColor = isOn ? .yellow : .gray
    secondsLamps = [Lamp(color: color, isOn: isOn)]
  }
  
  mutating func updateUppperRowHoursLamps(for hours: Int) {
    let upperHours = (min(4, hours / 5))
    upperHoursLamps = Array(repeating: Lamp(color: .red, isOn: true), count: upperHours) + Array(repeating: Lamp(color: .gray, isOn: false), count: max(0, 4 - upperHours))
  }
  
  mutating func updateLowerRowHoursLamps(for hours: Int) {
    // Calculate the remainder when dividing hours by 5 to get the bottom hours
    let lowerHours = hours % 5
    lowerHoursLamps = Array(repeating: Lamp(color: .red, isOn: true), count: lowerHours) + Array(repeating: Lamp(color: .gray, isOn: false), count: max(0, 4 - lowerHours))
  }
  
  mutating func updateUpperMinutesLamps(for minutes: Int) {
    let topMinutes = minutes / 5
    upperMinutesLamps = Array(repeating: Lamp(color: .yellow, isOn: true), count: topMinutes) + Array(repeating: Lamp(color: .gray, isOn: false), count: max(0, 11 - topMinutes))
    
    // Set every 3rd lamp to red
    for i in stride(from: 2, to: topMinutes, by: 3) {
      upperMinutesLamps[i] = Lamp(color: .red, isOn: true)
    }
  }
}
