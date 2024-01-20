
import XCTest
@testable import BerlinClock

class BerlinClockModelTests: XCTestCase {
  
  func testUpdateSecondsLamps() {
    var model = BerlinClockModel()
    model.updateSecondsLamps(for: 12)
    XCTAssertTrue(model.secondsLamps[0].isOn)
  }
}
