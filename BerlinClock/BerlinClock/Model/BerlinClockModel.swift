
import Foundation

struct BerlinClockModel: Equatable {
  var secondsLamps: [Lamp] = [Lamp(color: .berlinGray, isOn: false)]
  var upperHoursLamps: [Lamp] = Array(repeating: Lamp(color: .berlinGray, isOn: false), count: BerlinClockConstants.upperRowHoursLampsCount)
  var lowerHoursLamps: [Lamp] = Array(repeating: Lamp(color: .berlinGray, isOn: false), count: BerlinClockConstants.lowerRowHoursLampsCount)
  var upperMinutesLamps: [Lamp] = Array(repeating: Lamp(color: .berlinGray, isOn: false), count: BerlinClockConstants.upperRowMinutesLampsCount)
  var lowerMinutesLamps: [Lamp] = Array(repeating: Lamp(color: .berlinGray, isOn: false), count: BerlinClockConstants.lowerRowMinutesLampsCount)
}

extension BerlinClockModel {
    
  mutating func updateLamps(for time: DateComponents) {
    updateSecondsLamps(for: time.second ?? 0)
    updateUppperRowHoursLamps(for: time.hour ?? 0)
    updateLowerRowHoursLamps(for: time.hour ?? 0)
    updateUpperMinutesLamps(for: time.minute ?? 0)
    updateLowerMinutesLamps(for: time.minute ?? 0)
  }
  
  mutating func updateSecondsLamps(for seconds: Int) {
    let isOn = seconds % 2 == 0
    let color: LampColor = isOn ? .berlinYellow : .berlinGray
    secondsLamps = [Lamp(color: color, isOn: isOn)]
  }
  
  mutating func updateUppperRowHoursLamps(for hours: Int) {
    let upperHours = (min(4, hours / 5))
    upperHoursLamps = Array(repeating: Lamp(color: .berlinRed, isOn: true), count: upperHours) + Array(repeating: Lamp(color: .berlinGray, isOn: false), count: max(0, 4 - upperHours))
  }
  
  mutating func updateLowerRowHoursLamps(for hours: Int) {
    // Calculate the remainder when dividing hours by 5 to get the bottom hours
    let lowerHours = hours % 5
    lowerHoursLamps = Array(repeating: Lamp(color: .berlinRed, isOn: true), count: lowerHours) + Array(repeating: Lamp(color: .berlinGray, isOn: false), count: max(0, 4 - lowerHours))
  }
  
  mutating func updateUpperMinutesLamps(for minutes: Int) {
    let topMinutes = minutes / 5
    upperMinutesLamps = Array(repeating: Lamp(color: .berlinYellow, isOn: true), count: topMinutes) + Array(repeating: Lamp(color: .berlinGray, isOn: false), count: max(0, 11 - topMinutes))
    
    // Set every 3rd lamp to red
    for i in stride(from: 2, to: topMinutes, by: 3) {
      upperMinutesLamps[i] = Lamp(color: .berlinRed, isOn: true)
    }
  }
  
  mutating func updateLowerMinutesLamps(for minutes: Int) {
    let bottomMinutes = minutes % 5
    lowerMinutesLamps = Array(repeating: Lamp(color: .berlinYellow, isOn: true), count: bottomMinutes) + Array(repeating: Lamp(color: .berlinGray, isOn: false), count: max(0, 4 - bottomMinutes))
  }
}
