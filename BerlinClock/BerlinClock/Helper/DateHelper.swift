import Foundation

struct DateHelper {
  static func getCurrentDate() -> Date {
    return Date()
  }
  
  static func getComponents(from date: Date) -> DateComponents {
    return Calendar.current.dateComponents([.hour, .minute, .second], from: date)
  }
}
